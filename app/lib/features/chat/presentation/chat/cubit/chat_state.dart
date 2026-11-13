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

  /// The free plan has no messages; the gate comes before the consent step.
  plusRequired,
}

final class const ChatState({
  final Resource<ChatStage> stage = const Loading(),
  final List<ChatMessage> messages = const [],
  final List<String> options = const [],
  final FormInput<String> draft = const FormInput(''),
  final ChatMode mode = ChatMode.free,
  final int messagesLeft = 0,
  final bool hasPlus = false,
  final bool isReplying = false,
  final Resource<void> enableAction = const Initial(),
  final Resource<void> saveAction = const Initial(),
  final Resource<void> saveLearningAction = const Initial(),
}) with Equatable {
  ChatState copyWith({
    Resource<ChatStage>? stage,
    List<ChatMessage>? messages,
    List<String>? options,
    FormInput<String>? draft,
    ChatMode? mode,
    int? messagesLeft,
    bool? hasPlus,
    bool? isReplying,
    Resource<void>? enableAction,
    Resource<void>? saveAction,
    Resource<void>? saveLearningAction,
  }) {
    return ChatState(
      stage: stage ?? this.stage,
      messages: messages ?? this.messages,
      options: options ?? this.options,
      draft: draft ?? this.draft,
      mode: mode ?? this.mode,
      messagesLeft: messagesLeft ?? this.messagesLeft,
      hasPlus: hasPlus ?? this.hasPlus,
      isReplying: isReplying ?? this.isReplying,
      enableAction: enableAction ?? this.enableAction,
      saveAction: saveAction ?? this.saveAction,
      saveLearningAction: saveLearningAction ?? this.saveLearningAction,
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
    hasPlus,
    isReplying,
    enableAction,
    saveAction,
    saveLearningAction,
  ];
}
