import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/fight_style_result.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/reaction_pattern.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/repositories/fight_style_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';

part 'fight_style_state.dart';

class FightStyleCubit({
  required final FightStyleRepository _repository,
  required final PairingRepository _pairingRepository,
}) extends Cubit<FightStyleState> {
  this : super(const FightStyleState());

  String? _partnerName;

  /// Shows the saved result when there is one; otherwise the exercise starts fresh.
  Future<void> load() async {
    emit(state.copyWith(result: const Loading()));
    try {
      final saved = await _repository.getSavedRanked();
      _partnerName = await _readPartnerName();
      final result = FightStyleResult.fromRecord(saved, partnerName: _partnerName);
      if (isClosed) return;
      emit(state.copyWith(result: Success<FightStyleResult?>(result), isAnswering: result == null));
    } on LocalizedException catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(result: Failure.fromObject(exception), isAnswering: false));
    }
  }

  void select(String pattern) {
    if (state.isSaving || !reactionPatternKeys.contains(pattern)) return;
    final answers = [...state.answers];
    while (answers.length <= state.questionIndex) {
      answers.add('');
    }
    answers[state.questionIndex] = pattern;
    emit(state.copyWith(answers: answers));
  }

  /// Goes forward, saving the ranking after the last answer.
  Future<void> next() async {
    if (!state.canContinue || state.isSaving) return;
    if (state.isLastQuestion) {
      await _save();

      return;
    }
    emit(state.copyWith(questionIndex: state.questionIndex + 1));
  }

  void back() {
    if (state.questionIndex == 0 || state.isSaving) return;
    emit(state.copyWith(questionIndex: state.questionIndex - 1));
  }

  /// Starts again with empty answers; the saved result stays until a new one is finished.
  void retake() {
    emit(state.copyWith(isAnswering: true, questionIndex: 0, answers: const [], isInTools: false));
  }

  /// Adds the result description to the person's repair tools; nothing goes to the partner.
  Future<void> addRepairTool(String note) async {
    if (state.savedResult == null || state.isInTools || state.isAdding) return;

    emit(state.copyWith(addAction: const Loading()));
    try {
      await _repository.addRepairTool(note);
      if (isClosed) return;
      emit(state.copyWith(isInTools: true, addAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(addAction: Failure.fromObject(exception)));
      emit(state.copyWith(addAction: const Initial()));
    }
  }

  Future<void> _save() async {
    if (!state.isComplete) return;

    final answers = state.answers;
    emit(state.copyWith(saveAction: const Loading()));
    try {
      final ranked = rankReactions(answers);
      await _repository.saveRanked(ranked);
      if (isClosed) return;
      emit(
        state.copyWith(
          result: Success<FightStyleResult?>(
            FightStyleResult(ranked: ranked, partnerName: _partnerName),
          ),
          isAnswering: false,
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<String?> _readPartnerName() async {
    try {
      return (await _pairingRepository.getPartner())?.displayName;
    } on LocalizedException {
      return null;
    }
  }
}
