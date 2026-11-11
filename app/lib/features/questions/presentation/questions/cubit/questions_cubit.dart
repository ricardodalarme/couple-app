import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/questions/data/models/question_thread.dart';
import 'package:flutter_bloc_starter/features/questions/data/repositories/questions_repository.dart';

part 'questions_state.dart';

class QuestionsCubit({required final QuestionsRepository _repository})
    extends Cubit<QuestionsState> {
  this : super(const QuestionsState());

  /// Reads the current question, then reads again on resume or "check again".
  Future<void> load() async {
    if (isClosed) return;
    if (state.thread is! Success) emit(state.copyWith(thread: const Loading()));
    try {
      final thread = await _repository.getThread();
      if (isClosed) return;
      emit(state.copyWith(thread: Success(thread), draft: '', isEditing: false));
    } catch (exception) {
      if (isClosed || state.thread is Success) return;
      emit(state.copyWith(thread: Failure.fromObject(exception)));
    }
  }

  void startEditing() {
    final thread = state.current;
    final own = thread?.ownAnswer;
    if (thread == null || own == null || !thread.canEdit || state.isSaving) return;

    emit(state.copyWith(draft: own.body, isEditing: true));
  }

  void cancelEditing() {
    if (state.isSaving) return;
    emit(state.copyWith(draft: '', isEditing: false));
  }

  void onDraftChanged(String text) {
    if (state.isSaving) return;
    emit(state.copyWith(draft: text));
  }

  /// Inserts the first answer or replaces the person's own row when editing.
  Future<void> save() async {
    final thread = state.current;
    if (isClosed || thread == null || state.isSaving || !state.canSave) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final answer = await _repository.saveAnswer(thread: thread, body: state.draft);
      if (isClosed) return;
      final saved = await _readAfterSave(thread, answer);
      if (isClosed) return;
      emit(
        state.copyWith(
          thread: Success(saved),
          draft: '',
          isEditing: false,
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<QuestionThread> _readAfterSave(QuestionThread thread, QuestionAnswer answer) async {
    try {
      return await _repository.getThread();
    } catch (_) {
      return thread.withOwnAnswer(answer);
    }
  }
}
