part of 'questions_cubit.dart';

const int answerMaxLength = 1000;

enum QuestionsView() {
  answer,
  waiting,
  revealed,
}

final class const QuestionsState({
  final Resource<QuestionThread> thread = const Loading(),
  final FormInput<String> draft = const FormInput(''),
  final bool isEditing = false,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The loaded thread, or null while loading or failed.
  QuestionThread? get current => switch (thread) {
    Success(:final value) => value,
    _ => null,
  };

  bool get isSaving => saveAction.isLoading;

  QuestionsView get view {
    final thread = current;
    if (thread == null) return QuestionsView.answer;
    if (thread.isRevealed) return QuestionsView.revealed;
    if (thread.isAnswered) return QuestionsView.waiting;

    return QuestionsView.answer;
  }

  bool get showsAnswerForm => view == QuestionsView.answer || isEditing;

  QuestionsState copyWith({
    Resource<QuestionThread>? thread,
    FormInput<String>? draft,
    bool? isEditing,
    Resource<void>? saveAction,
  }) {
    return QuestionsState(
      thread: thread ?? this.thread,
      draft: draft ?? this.draft,
      isEditing: isEditing ?? this.isEditing,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [thread, draft, isEditing, saveAction];
}
