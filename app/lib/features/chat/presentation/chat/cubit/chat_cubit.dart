import 'dart:async';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/learned_items_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:uuid/uuid.dart';

part 'chat_state.dart';

class ChatCubit({
  required final ChatRepository _chatRepository,
  required final LearnedItemsRepository _learnedItemsRepository,
  final Duration _idleTimeout = chatIdleTimeout,
}) extends Cubit<ChatState> {
  this : super(const ChatState());

  final Uuid _uuid = const Uuid();
  final String _session = const Uuid().v4();
  StreamSubscription<ChatEvent>? _subscription;

  /// Chooses the kind of help before the first message.
  void setMode(ChatMode mode) => emit(state.copyWith(mode: mode));

  /// Reads whether the chat is on and how many messages are left today.
  Future<void> load() async {
    emit(state.copyWith(stage: const Loading()));
    try {
      final status = await _chatRepository.getStatus();
      emit(
        state.copyWith(
          stage: Success(
            !status.hasPlus
                ? ChatStage.plusRequired
                : !status.isEnabled
                ? ChatStage.needsConsent
                : status.messagesLeft <= 0
                ? ChatStage.limitReached
                : ChatStage.ready,
          ),
          messagesLeft: status.messagesLeft,
          hasPlus: status.hasPlus,
        ),
      );
    } catch (exception) {
      emit(state.copyWith(stage: Failure.fromObject(exception)));
    }
  }

  /// Turns the chat on, which is the consent to send messages to the model.
  Future<void> enable() async {
    if (state.enableAction.isLoading) return;

    emit(state.copyWith(enableAction: const Loading()));
    try {
      await _chatRepository.enable();
      emit(state.copyWith(enableAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(enableAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(enableAction: const Initial()));
  }

  void onDraftChanged(String draft) => emit(state.copyWith(draft: draft));

  /// Sends the typed message.
  Future<void> sendDraft() async {
    final text = state.draft.trim();
    emit(state.copyWith(draft: ''));
    await send(text);
  }

  /// Sends [text] and streams the reply; crisis wording is answered locally and never leaves the device.
  Future<void> send(String text) async {
    final message = text.trim();
    if (message.isEmpty || message.length > chatMessageMaxLength || state.isReplying) return;

    final isCrisis = looksLikeCrisis(message);
    final userMessage = ChatMessage(
      id: _uuid.v4(),
      role: ChatRole.user,
      text: message,
      excludeFromHistory: isCrisis,
    );
    if (isCrisis) {
      emit(
        state.copyWith(
          messages: [
            ...state.messages,
            userMessage,
            ChatMessage(id: _uuid.v4(), role: ChatRole.mascot, text: '', isCrisis: true),
          ],
          options: const [],
        ),
      );
      return;
    }

    final reply = ChatMessage(
      id: _uuid.v4(),
      role: ChatRole.mascot,
      text: '',
      isStreaming: true,
      retryText: message,
    );
    final messages = state.messages;
    final history = [
      for (final item in messages)
        if (!item.isCrisis && !item.excludeFromHistory) item,
    ];
    emit(
      state.copyWith(
        messages: [...messages, userMessage, reply],
        options: const [],
        isReplying: true,
      ),
    );

    final completer = Completer<void>();
    _subscription = _chatRepository
        .send(
          message: message,
          history: history,
          locale: LocaleSettings.currentLocale.languageTag,
          mode: state.mode,
          session: _session,
        )
        .timeout(_idleTimeout)
        .listen(
          (event) => _onEvent(reply.id, event),
          onError: (Object _) {
            _interrupt(reply.id);
            completer.complete();
          },
          onDone: () {
            _finish(reply.id);
            completer.complete();
          },
          cancelOnError: true,
        );
    await completer.future;
  }

  /// Sends the interrupted reply's own turn again.
  Future<void> retry(ChatMessage message) async {
    final text = message.retryText;
    if (text == null || state.isReplying) return;
    emit(state.copyWith(messages: _withoutReplyPair(state.messages, message.id)));
    await send(text);
  }

  /// Turns a mascot reply into a slip.
  Future<void> saveAsSlip(ChatMessage message) async {
    if (message.text.trim().isEmpty || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _chatRepository.saveAsSlip(message.text);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  /// Keeps a reply as a pending learning, for the person to review later.
  Future<void> saveLearning({
    required LearnedTarget target,
    required String text,
    String? excerpt,
  }) async {
    if (text.trim().isEmpty || state.saveLearningAction.isLoading) return;

    emit(state.copyWith(saveLearningAction: const Loading()));
    try {
      await _learnedItemsRepository.add(target: target, text: text, excerpt: excerpt);
      emit(state.copyWith(saveLearningAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveLearningAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveLearningAction: const Initial()));
  }

  void _onEvent(String replyId, ChatEvent event) {
    switch (event) {
      case ChatDelta(:final text):
        emit(state.copyWith(messages: _update(replyId, (m) => m.copyWith(text: m.text + text))));
      case ChatDone(:final options):
        emit(
          state.copyWith(
            messages: _update(replyId, (m) => m.copyWith(isStreaming: false)),
            options: options,
            isReplying: false,
            messagesLeft: state.messagesLeft > 0 ? state.messagesLeft - 1 : 0,
          ),
        );
      case ChatCrisis():
        emit(
          state.copyWith(
            messages: [
              for (var index = 0; index < state.messages.length; index++)
                if (state.messages[index].id == replyId)
                  ChatMessage(
                    id: state.messages[index].id,
                    role: state.messages[index].role,
                    text: '',
                    isCrisis: true,
                  )
                else if (index + 1 < state.messages.length &&
                    state.messages[index + 1].id == replyId &&
                    state.messages[index].role == ChatRole.user)
                  state.messages[index].copyWith(excludeFromHistory: true)
                else
                  state.messages[index],
            ],
            isReplying: false,
          ),
        );
      case ChatError(:final code):
        _onError(replyId, code);
    }
  }

  void _onError(String replyId, String code) {
    final withoutReply = [
      for (final m in state.messages)
        if (m.id != replyId) m,
    ];
    switch (code) {
      case 'CHAT_LIMIT':
        emit(
          state.copyWith(
            messages: withoutReply,
            stage: const Success(ChatStage.limitReached),
            messagesLeft: 0,
            isReplying: false,
          ),
        );
      case 'CHAT_DISABLED':
        emit(
          state.copyWith(
            messages: withoutReply,
            stage: const Success(ChatStage.needsConsent),
            isReplying: false,
          ),
        );
      case 'CHAT_UNAVAILABLE':
        emit(
          state.copyWith(
            messages: withoutReply,
            stage: const Success(ChatStage.unavailable),
            isReplying: false,
          ),
        );
      default:
        _interrupt(replyId);
    }
  }

  /// Marks the reply as cut short so the person can try again; what already arrived stays.
  void _interrupt(String replyId) {
    emit(
      state.copyWith(
        messages: _update(replyId, (m) => m.copyWith(isStreaming: false, isInterrupted: true)),
        isReplying: false,
      ),
    );
  }

  /// A stream that closes without a done event is treated as cut short when it brought no text.
  void _finish(String replyId) {
    if (!state.isReplying) return;
    final reply = state.messages.firstWhere((m) => m.id == replyId);
    if (reply.text.isEmpty) {
      _interrupt(replyId);
    } else {
      emit(
        state.copyWith(
          messages: _update(replyId, (m) => m.copyWith(isStreaming: false)),
          isReplying: false,
        ),
      );
    }
  }

  List<ChatMessage> _update(String id, ChatMessage Function(ChatMessage) change) => [
    for (final m in state.messages)
      if (m.id == id) change(m) else m,
  ];

  List<ChatMessage> _withoutReplyPair(List<ChatMessage> messages, String replyId) {
    final index = messages.indexWhere((message) => message.id == replyId);
    if (index < 0) return messages;
    final start = index > 0 && messages[index - 1].role == ChatRole.user ? index - 1 : index;

    return [...messages.sublist(0, start), ...messages.sublist(index + 1)];
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
