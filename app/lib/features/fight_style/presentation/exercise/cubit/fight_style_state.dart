part of 'fight_style_cubit.dart';

final class const FightStyleState({
  final Resource<FightStyleResult?> result = const Loading(),
  final int questionIndex = 0,
  final List<String> answers = const [],
  final bool isAnswering = true,
  final Resource<void> saveAction = const Initial(),
  final Resource<void> addAction = const Initial(),
  final bool isInTools = false,
}) with Equatable {
  /// The result to show, once it exists.
  FightStyleResult? get savedResult => switch (result) {
    Success(:final value) => value,
    _ => null,
  };

  bool get isLoading => result is Loading;

  bool get isSaving => saveAction.isLoading;

  bool get isAdding => addAction.isLoading;

  String? get currentAnswer => questionIndex < answers.length && answers[questionIndex].isNotEmpty
      ? answers[questionIndex]
      : null;

  bool get canContinue => currentAnswer != null;

  bool get isLastQuestion => questionIndex >= fightStyleQuestionCount - 1;

  bool get isComplete =>
      answers.length == fightStyleQuestionCount && answers.every((answer) => answer.isNotEmpty);

  FightStyleState copyWith({
    Resource<FightStyleResult?>? result,
    int? questionIndex,
    List<String>? answers,
    bool? isAnswering,
    Resource<void>? saveAction,
    Resource<void>? addAction,
    bool? isInTools,
  }) {
    return FightStyleState(
      result: result ?? this.result,
      questionIndex: questionIndex ?? this.questionIndex,
      answers: answers ?? this.answers,
      isAnswering: isAnswering ?? this.isAnswering,
      saveAction: saveAction ?? this.saveAction,
      addAction: addAction ?? this.addAction,
      isInTools: isInTools ?? this.isInTools,
    );
  }

  @override
  List<Object?> get props => [
    result,
    questionIndex,
    answers,
    isAnswering,
    saveAction,
    addAction,
    isInTools,
  ];
}
