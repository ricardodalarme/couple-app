part of 'love_style_cubit.dart';

final class const LoveStyleState({
  final Resource<LoveStyleResult?> result = const Loading(),
  final int questionIndex = 0,
  final List<String> answers = const [],
  final bool isAnswering = true,
  final Resource<void> saveAction = const Initial(),
  final Resource<void> manualAction = const Initial(),
  final Resource<void> shareAction = const Initial(),
  final Resource<void> revokeAction = const Initial(),
  final bool isInManual = false,
  final String? sharedMessageId,
  final bool hasPartner = false,
  final String? partnerName,
  final bool pairingFailed = false,
}) with Equatable {
  /// The result to show, once it exists.
  LoveStyleResult? get savedResult => switch (result) {
    Success(:final value) => value,
    _ => null,
  };

  bool get isSaving => saveAction.isLoading;

  bool get isSavingManual => manualAction.isLoading;

  bool get isSharing => shareAction.isLoading;

  bool get isRevokingShare => revokeAction.isLoading;

  bool get isShared => sharedMessageId != null;

  String? get currentAnswer => questionIndex < answers.length && answers[questionIndex].isNotEmpty
      ? answers[questionIndex]
      : null;

  bool get canContinue => currentAnswer != null;

  bool get isLastQuestion => questionIndex >= loveStyleQuestionCount - 1;

  bool get isComplete =>
      answers.length == loveStyleQuestionCount && answers.every((answer) => answer.isNotEmpty);

  LoveStyleState copyWith({
    Resource<LoveStyleResult?>? result,
    int? questionIndex,
    List<String>? answers,
    bool? isAnswering,
    Resource<void>? saveAction,
    Resource<void>? manualAction,
    Resource<void>? shareAction,
    Resource<void>? revokeAction,
    bool? isInManual,
    String? sharedMessageId,
    bool clearSharedMessage = false,
    bool? hasPartner,
    String? partnerName,
    bool clearPartnerName = false,
    bool? pairingFailed,
  }) {
    return LoveStyleState(
      result: result ?? this.result,
      questionIndex: questionIndex ?? this.questionIndex,
      answers: answers ?? this.answers,
      isAnswering: isAnswering ?? this.isAnswering,
      saveAction: saveAction ?? this.saveAction,
      manualAction: manualAction ?? this.manualAction,
      shareAction: shareAction ?? this.shareAction,
      revokeAction: revokeAction ?? this.revokeAction,
      isInManual: isInManual ?? this.isInManual,
      sharedMessageId: clearSharedMessage ? null : sharedMessageId ?? this.sharedMessageId,
      hasPartner: hasPartner ?? this.hasPartner,
      partnerName: partnerName ?? (clearPartnerName ? null : this.partnerName),
      pairingFailed: pairingFailed ?? this.pairingFailed,
    );
  }

  @override
  List<Object?> get props => [
    result,
    questionIndex,
    answers,
    isAnswering,
    saveAction,
    manualAction,
    shareAction,
    revokeAction,
    isInManual,
    sharedMessageId,
    hasPartner,
    partnerName,
    pairingFailed,
  ];
}
