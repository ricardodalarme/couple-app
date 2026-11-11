import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/guide_session.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

part 'guide_state.dart';

class GuideCubit({
  required final GuidesRepository _repository,
  required final PlusRepository _plusRepository,
  required final GuideSession _session,
}) extends Cubit<GuideState> {
  this : super(const GuideState());

  /// Opens [slug] at the saved step and answers, unless they expired or the guide content changed.
  Future<void> start(String slug) async {
    _session.syncUser(_repository.currentUserId);
    emit(state.copyWith(guide: const Loading()));
    try {
      final guide = await _repository.getGuide(
        slug,
        languageCode: LocaleSettings.currentLocale.languageCode,
      );
      if (guide == null) {
        if (isClosed) return;
        emit(state.copyWith(guide: Failure.fromObject(const LocalizedException(l10nKey: 'other'))));

        return;
      }

      if (guide.isPlusOnly && !await _hasPlus()) {
        if (isClosed) return;
        emit(GuideState(guide: Success(guide), isLocked: true));

        return;
      }

      final saved = await _repository.getProgress(slug);
      final progress = saved?.contentVersion == guide.contentVersion ? saved : null;
      final answers = <String>[];
      for (var index = 0; index < guide.stepCount; index++) {
        final savedAnswers = progress?.answers;
        if (savedAnswers != null && index < savedAnswers.length) {
          answers.add(savedAnswers[index]);
        } else {
          answers.add('');
        }
      }
      final stepIndex = (progress?.stepIndex ?? 0).clamp(0, guide.stepCount - 1);
      final showsGate = guide.isSensitive && !_session.hasShownSensitiveGate;
      if (showsGate) _session.markSensitiveGateShown();
      if (isClosed) return;
      emit(
        GuideState(
          guide: Success(guide),
          answers: answers,
          stepIndex: stepIndex,
          prepId: progress?.prepId,
          showSensitiveGate: showsGate,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(guide: Failure.fromObject(exception)));
    }
  }

  void hideSensitiveGate() {
    if (!state.showSensitiveGate) return;
    emit(state.copyWith(showSensitiveGate: false));
  }

  Future<bool> _hasPlus() async {
    try {
      return (await _plusRepository.getPlus()).hasPlus;
    } on Object {
      return false;
    }
  }

  /// Edits the current step and keeps the answer for this person.
  Future<void> onAnswerChanged(String answer) async {
    final guide = state.currentGuide;
    if (guide == null || state.isFinished) return;
    final answers = [...state.answers];
    while (answers.length < guide.stepCount) {
      answers.add('');
    }
    answers[state.stepIndex] = answer;
    emit(state.copyWith(answers: answers));
    await _persist();
  }

  /// Moves one step forward, saving a preparation after the last step.
  Future<void> next() async {
    if (state.isSaving || state.isFinished) return;
    if (state.isLastStep) {
      await _finish();

      return;
    }
    emit(state.copyWith(stepIndex: state.stepIndex + 1));
    await _persist();
  }

  Future<void> back() async {
    if (state.stepIndex == 0 || state.isSaving || state.isFinished) return;
    emit(state.copyWith(stepIndex: state.stepIndex - 1));
    await _persist();
  }

  Future<void> _finish() async {
    final guide = state.currentGuide;
    if (guide == null) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final prepId = await _repository.savePrep(
        prepId: state.prepId,
        guide: guide.guideType,
        topic: guide.title,
        notes: state.answers.where((answer) => answer.trim().isNotEmpty).join('\n\n'),
        draft: state.currentAnswer,
      );
      if (isClosed) return;
      emit(state.copyWith(prepId: prepId, isFinished: true, saveAction: const Success(null)));
      await _persist();
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> _persist() async {
    final guide = state.currentGuide;
    if (guide == null) return;
    try {
      await _repository.saveProgress(
        guide.slug,
        GuideProgress(
          stepIndex: state.stepIndex,
          answers: state.answers,
          savedAt: DateTime.now(),
          contentVersion: guide.contentVersion,
          prepId: state.prepId,
        ),
      );
    } on LocalizedException {
      // The answers stay on screen; the next edit tries again.
    }
  }
}
