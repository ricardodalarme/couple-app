part of 'checkin_cubit.dart';

enum CheckinStep() {
  intro,
  questions,
  waiting,
  reveal,
}

final class const CheckinState({
  final Resource<CheckinWeek> week = const Loading(),
  final CheckinStep step = CheckinStep.intro,
  final int questionIndex = 0,
  final String draft = '',
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The loaded week, or null while loading or failed.
  CheckinWeek? get current => switch (week) {
    Success(:final value) => value,
    _ => null,
  };

  bool get isSaving => saveAction.isLoading;

  int get questionNumber => questionIndex + 1;

  bool get isLastQuestion => questionIndex >= checkinQuestionCount - 1;

  bool get isOwnComplete => current?.isOwnComplete ?? false;

  CheckinState copyWith({
    Resource<CheckinWeek>? week,
    CheckinStep? step,
    int? questionIndex,
    String? draft,
    Resource<void>? saveAction,
  }) {
    return CheckinState(
      week: week ?? this.week,
      step: step ?? this.step,
      questionIndex: questionIndex ?? this.questionIndex,
      draft: draft ?? this.draft,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [week, step, questionIndex, draft, saveAction];
}
