part of 'guide_cubit.dart';

final class const GuideState({
  final Resource<Guide> guide = const Loading(),
  final int stepIndex = 0,
  final List<String> answers = const [],
  final String? prepId,
  final bool showSensitiveGate = false,
  final bool isFinished = false,
  final bool isLocked = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  Guide? get currentGuide => switch (guide) {
    Success(:final value) => value,
    _ => null,
  };

  String get currentAnswer => stepIndex < answers.length ? answers[stepIndex] : '';

  bool get isLastStep => currentGuide == null || stepIndex >= currentGuide!.stepCount - 1;

  bool get canGoBack => stepIndex > 0;

  bool get isSaving => saveAction.isLoading;

  GuideState copyWith({
    Resource<Guide>? guide,
    int? stepIndex,
    List<String>? answers,
    String? prepId,
    bool? showSensitiveGate,
    bool? isFinished,
    bool? isLocked,
    Resource<void>? saveAction,
  }) {
    return GuideState(
      guide: guide ?? this.guide,
      stepIndex: stepIndex ?? this.stepIndex,
      answers: answers ?? this.answers,
      prepId: prepId ?? this.prepId,
      showSensitiveGate: showSensitiveGate ?? this.showSensitiveGate,
      isFinished: isFinished ?? this.isFinished,
      isLocked: isLocked ?? this.isLocked,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [
    guide,
    stepIndex,
    answers,
    prepId,
    showSensitiveGate,
    isFinished,
    isLocked,
    saveAction,
  ];
}
