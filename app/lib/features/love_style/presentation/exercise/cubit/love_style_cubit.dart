import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/love_style/data/models/love_pattern.dart';
import 'package:flutter_bloc_starter/features/love_style/data/models/love_style_result.dart';
import 'package:flutter_bloc_starter/features/love_style/data/repositories/love_style_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';

part 'love_style_state.dart';

class LoveStyleCubit({
  required final LoveStyleRepository _repository,
  required final PairingRepository _pairingRepository,
}) extends Cubit<LoveStyleState> {
  this : super(const LoveStyleState());

  /// Shows the saved result when there is one; otherwise the exercise starts fresh.
  Future<void> load() async {
    emit(state.copyWith(result: const Loading(), pairingFailed: false));
    try {
      final saved = await _repository.getSavedRanked();
      final sharedMessageId = await _repository.getSharedMessageId();
      final manualValue = await _repository.getManualEntry();
      final partner = await _readPartner();
      final result = LoveStyleResult.fromRecord(saved);
      if (isClosed) return;
      emit(
        state.copyWith(
          result: Success<LoveStyleResult?>(result),
          isAnswering: result == null,
          isInManual: manualValue != null,
          sharedMessageId: sharedMessageId,
          clearSharedMessage: sharedMessageId == null,
          hasPartner: partner.profile != null,
          partnerName: partner.profile?.displayName,
          clearPartnerName: true,
          pairingFailed: partner.failed,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(result: Failure.fromObject(exception), isAnswering: false));
    }
  }

  void select(String pattern) {
    if (state.isSaving || !lovePatternKeys.contains(pattern)) return;
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

  /// Starts again with empty answers; a shared note is revoked so it cannot look like the new result.
  Future<void> retake() async {
    if (state.isSaving || state.isRevokingShare) return;
    if (state.isShared) {
      await revokeShare();
      if (isClosed || state.isShared) return;
    }
    emit(state.copyWith(isAnswering: true, questionIndex: 0, answers: const [], isInManual: false));
  }

  /// Writes the result description to the person's private manual.
  Future<void> saveToManual(String description) async {
    if (state.savedResult == null || state.isInManual || state.isSavingManual) return;

    emit(state.copyWith(manualAction: const Loading()));
    try {
      await _repository.saveManualEntry(description);
      if (isClosed) return;
      emit(state.copyWith(isInManual: true, manualAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(manualAction: Failure.fromObject(exception)));
      emit(state.copyWith(manualAction: const Initial()));
    }
  }

  /// Sends the short description to the partner as a note.
  Future<void> share(String body) async {
    if (!state.hasPartner ||
        state.sharedMessageId != null ||
        state.isSharing ||
        state.isRevokingShare) {
      return;
    }

    emit(state.copyWith(shareAction: const Loading()));
    try {
      final id = await _repository.share(body);
      if (isClosed) return;
      emit(state.copyWith(sharedMessageId: id, shareAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(shareAction: Failure.fromObject(exception)));
      emit(state.copyWith(shareAction: const Initial()));
    }
  }

  /// Deletes the shared note so it stops appearing for the partner.
  Future<void> revokeShare() async {
    final id = state.sharedMessageId;
    if (id == null || state.isRevokingShare) return;

    emit(state.copyWith(revokeAction: const Loading()));
    try {
      await _repository.revokeShare(id);
      if (isClosed) return;
      emit(state.copyWith(clearSharedMessage: true, revokeAction: const Success(null)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(revokeAction: Failure.fromObject(exception)));
      emit(state.copyWith(revokeAction: const Initial()));
    }
  }

  Future<void> _save() async {
    if (!state.isComplete) return;

    final answers = state.answers;
    emit(state.copyWith(saveAction: const Loading()));
    try {
      final ranked = rankLovePatterns(answers);
      await _repository.saveRanked(ranked);
      if (isClosed) return;
      emit(
        state.copyWith(
          result: Success<LoveStyleResult?>(LoveStyleResult(ranked: ranked)),
          isAnswering: false,
          isInManual: false,
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<({Profile? profile, bool failed})> _readPartner() async {
    try {
      return (profile: await _pairingRepository.getPartner(), failed: false);
    } on Object {
      return (profile: null, failed: true);
    }
  }
}
