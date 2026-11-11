part of 'chat_cubit.dart';

/// Where the chat is before and after the first message.
enum ChatStage() {
  /// The person has not turned the chat on, so nothing is sent yet.
  needsConsent,

  ready,

  /// Today's messages are used up.
  limitReached,

  /// The server has no model configured.
  unavailable,
}

final class const ChatState({
  final Resource<ChatStage> stage = const Loading(),
  final List<ChatMessage> messages = const [],
  final List<String> options = const [],
  final String draft = '',
  final ChatMode mode = ChatMode.free,
  final int messagesLeft = 0,
  final bool isReplying = false,
  final Resource<void> enableAction = const Initial(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// Whether the draft can be sent now.
  bool get canSend =>
      !isReplying && draft.trim().isNotEmpty && draft.length <= chatMessageMaxLength;

  ChatState copyWith({
    Resource<ChatStage>? stage,
    List<ChatMessage>? messages,
    List<String>? options,
    String? draft,
    ChatMode? mode,
    int? messagesLeft,
    bool? isReplying,
    Resource<void>? enableAction,
    Resource<void>? saveAction,
  }) {
    return ChatState(
      stage: stage ?? this.stage,
      messages: messages ?? this.messages,
      options: options ?? this.options,
      draft: draft ?? this.draft,
      mode: mode ?? this.mode,
      messagesLeft: messagesLeft ?? this.messagesLeft,
      isReplying: isReplying ?? this.isReplying,
      enableAction: enableAction ?? this.enableAction,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [
    stage,
    messages,
    options,
    draft,
    mode,
    messagesLeft,
    isReplying,
    enableAction,
    saveAction,
  ];
}
