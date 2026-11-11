part of 'hard_conversation_cubit.dart';

/// What the page shows before the three steps can start.
enum HardConversationGate() {
  plusRequired,
  needsConsent,
  limitReached,
  unavailable,
  ready,
}

final class const HardConversationState({
  final Resource<void> status = const Loading(),
  final HardConversationGate gate = HardConversationGate.ready,
  final HardConversationStep step = HardConversationStep.whatHappened,
  final String whatChoice = '',
  final String whatText = '',
  final String needChoice = '',
  final String needText = '',
  final String message = '',
  final HardConversationTone tone = HardConversationTone.neutral,
  final bool hasPlus = false,
  final bool isGenerating = false,
  final Resource<void> enableAction = const Initial(),
  final Resource<void> generateAction = const Initial(),
  final Resource<void> sendAction = const Initial(),
  final Resource<void> copyAction = const Initial(),
}) with Equatable {
  bool get isReady => gate == HardConversationGate.ready;

  bool get canContinueWhat => whatChoice == hardConversationOtherChoice
      ? whatText.trim().isNotEmpty
      : whatChoice.isNotEmpty || whatText.trim().isNotEmpty;

  bool get canContinueNeed => needChoice.isNotEmpty || needText.trim().isNotEmpty;

  bool get canCopy => message.trim().isNotEmpty;

  bool get canSend => message.trim().isNotEmpty && !sendAction.isLoading;

  HardConversationState copyWith({
    Resource<void>? status,
    HardConversationGate? gate,
    HardConversationStep? step,
    String? whatChoice,
    String? whatText,
    String? needChoice,
    String? needText,
    String? message,
    HardConversationTone? tone,
    bool? hasPlus,
    bool? isGenerating,
    Resource<void>? enableAction,
    Resource<void>? generateAction,
    Resource<void>? sendAction,
    Resource<void>? copyAction,
  }) {
    return HardConversationState(
      status: status ?? this.status,
      gate: gate ?? this.gate,
      step: step ?? this.step,
      whatChoice: whatChoice ?? this.whatChoice,
      whatText: whatText ?? this.whatText,
      needChoice: needChoice ?? this.needChoice,
      needText: needText ?? this.needText,
      message: message ?? this.message,
      tone: tone ?? this.tone,
      hasPlus: hasPlus ?? this.hasPlus,
      isGenerating: isGenerating ?? this.isGenerating,
      enableAction: enableAction ?? this.enableAction,
      generateAction: generateAction ?? this.generateAction,
      sendAction: sendAction ?? this.sendAction,
      copyAction: copyAction ?? this.copyAction,
    );
  }

  @override
  List<Object?> get props => [
    status,
    gate,
    step,
    whatChoice,
    whatText,
    needChoice,
    needText,
    message,
    tone,
    hasPlus,
    isGenerating,
    enableAction,
    generateAction,
    sendAction,
    copyAction,
  ];
}
