import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/checkin/data/models/checkin_week.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';

part 'checkin_state.dart';

class CheckinCubit({required final CheckinRepository _repository}) extends Cubit<CheckinState> {
  this : super(const CheckinState());

  /// Reads this week and resumes wherever the person stopped.
  Future<void> load() async {
    if (isClosed) return;
    if (state.week is! Success) emit(state.copyWith(week: const Loading()));
    try {
      final week = await _repository.getWeek();
      if (isClosed) return;
      emit(_settle(week));
    } catch (exception) {
      if (isClosed || state.week is Success) return;
      emit(state.copyWith(week: Failure.fromObject(exception)));
    }
  }

  void start() {
    final week = state.current;
    if (week == null || !week.canParticipate) return;

    final question = week.firstUnanswered;
    emit(
      state.copyWith(
        step: CheckinStep.questions,
        questionIndex: question - 1,
        draft: week.answerFor(question)?.body ?? '',
      ),
    );
  }

  void onDraftChanged(String text) {
    if (state.step != CheckinStep.questions || state.isSaving) return;
    emit(state.copyWith(draft: text));
  }

  /// Saves the typed answer; a blank answer clears the saved row and moves on.
  Future<void> next() async {
    if (isClosed || state.isSaving || state.step != CheckinStep.questions) return;
    final week = state.current;
    if (week == null) return;

    final body = state.draft.trim();
    if (body.isEmpty) {
      await _clearOrAdvance(week);

      return;
    }

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final answer = await _repository.saveAnswer(
        week: week,
        question: state.questionNumber,
        body: body,
      );
      if (isClosed) return;
      final updated = week.withOwnAnswer(answer);
      emit(state.copyWith(week: Success(updated), draft: '', saveAction: const Success(null)));
      await _advance(updated);
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  /// Leaves this question blank; an already saved answer is removed.
  Future<void> skip() async {
    if (isClosed || state.isSaving || state.step != CheckinStep.questions) return;
    final week = state.current;
    if (week == null) return;

    await _clearOrAdvance(week);
  }

  /// Returns to the first question so answers can be edited before the reveal.
  void review() {
    final week = state.current;
    if (week == null) return;

    emit(
      state.copyWith(
        step: CheckinStep.questions,
        questionIndex: 0,
        draft: week.answerFor(1)?.body ?? '',
      ),
    );
  }

  /// Remembers that the person chose not to check in this week.
  Future<void> dismissThisWeek() async {
    final week = state.current;
    if (week == null) return;

    try {
      await _repository.dismissWeek(week.weekStart);
    } on Object {
      // A failed local write only re-shows the entry next time.
    }
  }

  Future<void> _clearOrAdvance(CheckinWeek week) async {
    final existing = week.answerFor(state.questionNumber);
    if (existing == null) {
      await _advance(week);

      return;
    }

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _repository.deleteAnswer(existing.id);
      if (isClosed) return;
      final updated = week.withoutAnswer(existing.question);
      emit(state.copyWith(week: Success(updated), draft: '', saveAction: const Success(null)));
      await _advance(updated);
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> _advance(CheckinWeek week) async {
    final nextIndex = state.questionIndex + 1;
    if (nextIndex < checkinQuestionCount) {
      final nextQuestion = nextIndex + 1;
      emit(
        state.copyWith(
          step: CheckinStep.questions,
          questionIndex: nextIndex,
          draft: week.answerFor(nextQuestion)?.body ?? '',
        ),
      );

      return;
    }

    if (week.isRevealed) {
      emit(state.copyWith(step: CheckinStep.reveal, questionIndex: 0, draft: ''));

      return;
    }

    emit(state.copyWith(step: CheckinStep.waiting, questionIndex: 0, draft: ''));
    if (week.isOwnComplete) await load();
  }

  CheckinState _settle(CheckinWeek week) {
    if (week.isRevealed) {
      return state.copyWith(
        week: Success(week),
        step: CheckinStep.reveal,
        questionIndex: 0,
        draft: '',
      );
    }
    if (week.isOwnComplete) {
      return state.copyWith(
        week: Success(week),
        step: CheckinStep.waiting,
        questionIndex: 0,
        draft: '',
      );
    }
    if (week.ownAnswers.isNotEmpty) {
      final question = week.firstUnanswered;

      return state.copyWith(
        week: Success(week),
        step: CheckinStep.questions,
        questionIndex: question - 1,
        draft: week.answerFor(question)?.body ?? '',
      );
    }

    return state.copyWith(
      week: Success(week),
      step: CheckinStep.intro,
      questionIndex: 0,
      draft: '',
    );
  }
}
