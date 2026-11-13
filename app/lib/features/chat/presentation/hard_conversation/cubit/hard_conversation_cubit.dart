import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/chat_models.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/hard_conversation_draft.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/chat_repository.dart';
import 'package:flutter_bloc_starter/features/chat/data/repositories/hard_conversation_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'hard_conversation_state.dart';

class HardConversationCubit({
  required final HardConversationRepository _repository,
  required final ChatRepository _chatRepository,
  final Duration _idleTimeout = chatIdleTimeout,
}) extends Cubit<HardConversationState> {
  this : super(const HardConversationState());

  final String _session = const Uuid().v4();

  /// Reads the consent, today's usage and the draft from the last day.
  Future<void> load() async {
    emit(state.copyWith(status: const Loading()));
    try {
      final status = await _chatRepository.getStatus();
      final draft = await _repository.readDraft();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: const Success(null),
          gate: !status.hasPlus
              ? HardConversationGate.plusRequired
              : !status.isEnabled
              ? HardConversationGate.needsConsent
              : status.messagesLeft <= 0
              ? HardConversationGate.limitReached
              : HardConversationGate.ready,
          hasPlus: status.hasPlus,
          step: draft?.step ?? HardConversationStep.whatHappened,
          whatChoice: draft?.whatChoice ?? '',
          whatText: FormInput(draft?.whatText ?? ''),
          needChoice: draft?.needChoice ?? '',
          needText: FormInput(draft?.needText ?? ''),
          message: FormInput(draft?.message ?? ''),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(status: Failure.fromObject(exception)));
    }
  }

  /// Turns the chat on from the consent step.
  Future<void> enable() async {
    if (state.enableAction.isLoading) return;

    emit(state.copyWith(enableAction: const Loading()));
    try {
      await _chatRepository.enable();
      if (isClosed) return;
      emit(state.copyWith(enableAction: const Success(null)));
      await load();
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(enableAction: Failure.fromObject(exception)));
    }
    if (isClosed) return;
    emit(state.copyWith(enableAction: const Initial()));
  }

  Future<void> selectWhat(String choice) async {
    if (choice == state.whatChoice) return;
    emit(state.copyWith(whatChoice: choice));
    await _persist();
  }

  Future<void> onWhatTextChanged(String text) async {
    emit(state.copyWith(whatText: FormInput(text)));
    await _persist();
  }

  Future<void> selectNeed(String choice) async {
    if (choice == state.needChoice) return;
    emit(state.copyWith(needChoice: choice));
    await _persist();
  }

  Future<void> onNeedTextChanged(String text) async {
    emit(state.copyWith(needText: FormInput(text)));
    await _persist();
  }

  /// Keeps the edited sentence; editing never asks the model again.
  Future<void> onMessageChanged(String text) async {
    emit(state.copyWith(message: FormInput(text)));
    await _persist();
  }

  /// Moves forward; the last step asks the model for one opening sentence.
  Future<void> next() async {
    if (!state.isReady) return;
    switch (state.step) {
      case HardConversationStep.whatHappened:
        if (!state.canContinueWhat) return;
        emit(state.copyWith(step: HardConversationStep.whatINeed));
        await _persist();
      case HardConversationStep.whatINeed:
        if (!state.canContinueNeed) return;
        emit(state.copyWith(step: HardConversationStep.howToSay, message: const FormInput('')));
        await _persist();
        await generate();
      case HardConversationStep.howToSay:
        return;
    }
  }

  Future<void> back() async {
    if (!state.isReady || state.isGenerating) return;
    final previous = switch (state.step) {
      HardConversationStep.whatHappened => HardConversationStep.whatHappened,
      HardConversationStep.whatINeed => HardConversationStep.whatHappened,
      HardConversationStep.howToSay => HardConversationStep.whatINeed,
    };
    if (previous == state.step) return;
    emit(state.copyWith(step: previous));
    await _persist();
  }

  /// Asks again with the same answers, softer or more direct.
  Future<void> regenerate(HardConversationTone tone) async {
    if (!state.isReady || state.isGenerating || tone == HardConversationTone.neutral) return;
    await generate(tone: tone);
  }

  Future<void> retry() async {
    if (!state.isReady || state.isGenerating) return;
    await generate(tone: state.tone);
  }

  /// Copies the edited sentence so it can be pasted anywhere.
  Future<void> copy() async {
    if (!state.canCopy) return;

    await Clipboard.setData(ClipboardData(text: state.message.value.trim()));
    if (isClosed) return;
    emit(state.copyWith(copyAction: const Success(null)));
    emit(state.copyWith(copyAction: const Initial()));
  }

  /// Sends the edited sentence as a widget note and forgets the local draft.
  Future<void> send() async {
    if (state.sendAction.isLoading || !_validateMessage()) return;

    emit(state.copyWith(sendAction: const Loading()));
    try {
      await _repository.sendAsNote(state.message.value.trim());
      await _repository.clearDraft();
      if (isClosed) return;
      emit(state.copyWith(sendAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(sendAction: Failure.fromObject(exception)));
    }
    if (isClosed) return;
    emit(state.copyWith(sendAction: const Initial()));
  }

  bool _validateMessage() {
    final validatedMessage = state.message.validate(
      CompositeValidator<String>([
        NonEmptyValidator(),
        MaxLengthValidator(hardConversationMessageMaxLength),
      ]),
    );

    emit(state.copyWith(message: validatedMessage));

    return validatedMessage.isValid;
  }

  Future<void> generate({HardConversationTone tone = HardConversationTone.neutral}) async {
    if (!state.isReady || state.isGenerating) return;

    final what = _answer(state.whatChoice, state.whatText.value);
    final need = _answer(state.needChoice, state.needText.value);
    if (what.isEmpty && need.isEmpty) return;

    emit(
      state.copyWith(
        tone: tone,
        message: const FormInput(''),
        isGenerating: true,
        generateAction: const Loading(),
      ),
    );

    final buffer = StringBuffer();
    try {
      final events = _repository
          .generate(
            what: what,
            need: need,
            locale: LocaleSettings.currentLocale.languageTag,
            session: _session,
            tone: tone,
          )
          .timeout(_idleTimeout);
      await for (final event in events) {
        switch (event) {
          case ChatDelta(:final text):
            buffer.write(text);
            emit(state.copyWith(message: FormInput(buffer.toString())));
          case ChatDone():
            break;
          case ChatCrisis():
            emit(
              state.copyWith(
                gate: HardConversationGate.unavailable,
                message: const FormInput(''),
                isGenerating: false,
                generateAction: const Initial(),
              ),
            );

            return;
          case ChatError(:final code):
            _onError(code);

            return;
        }
      }

      if (buffer.isEmpty) {
        emit(
          state.copyWith(isGenerating: false, generateAction: const Failure(UnknownException())),
        );

        return;
      }
      emit(state.copyWith(isGenerating: false, generateAction: const Success(null)));
      await _persist();
    } on Object catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(isGenerating: false, generateAction: Failure.fromObject(exception)));
    }
  }

  void _onError(String code) {
    final gate = switch (code) {
      'CHAT_LIMIT' => HardConversationGate.limitReached,
      'CHAT_DISABLED' => HardConversationGate.needsConsent,
      'CHAT_UNAVAILABLE' => HardConversationGate.unavailable,
      _ => null,
    };
    if (gate != null) {
      emit(
        state.copyWith(
          gate: gate,
          message: const FormInput(''),
          isGenerating: false,
          generateAction: const Initial(),
        ),
      );

      return;
    }
    emit(
      state.copyWith(
        isGenerating: false,
        generateAction: Failure(LocalizedException(l10nKey: code)),
      ),
    );
  }

  Future<void> _persist() async {
    final draft = HardConversationDraft(
      step: state.step,
      whatChoice: state.whatChoice,
      whatText: state.whatText.value,
      needChoice: state.needChoice,
      needText: state.needText.value,
      message: state.message.value,
      savedAt: clock.now(),
    );
    if (draft.isEmpty) {
      await _repository.clearDraft();

      return;
    }
    await _repository.saveDraft(draft);
  }

  String _answer(String choice, String text) {
    final typed = text.trim();
    if (choice == hardConversationOtherChoice) return typed;

    return [if (choice.isNotEmpty) choice, if (typed.isNotEmpty) typed].join(' — ');
  }
}
