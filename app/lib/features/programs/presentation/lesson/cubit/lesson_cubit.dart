import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';

part 'lesson_state.dart';

/// How the person left a lesson.
enum LessonOutcome() {
  completed,
  advanced,
  failed,
}

class LessonCubit({
  required final ProgramsRepository _programsRepository,
  required final PlusRepository _plusRepository,
  required final PrivacyRepository _privacyRepository,
}) extends Cubit<LessonState> {
  this : super(const LessonState());

  Future<void> load({required String slug, required int day}) async {
    emit(state.copyWith(program: const Loading(), day: day));
    try {
      final (hasPlus, hasSensitiveConsent, program, enrollment, progress) = await (
        _hasPlus(),
        _hasSensitiveConsent(),
        _programsRepository.getProgram(slug),
        _programsRepository.getEnrollment(slug),
        _programsRepository.getLessonProgress(slug),
      ).wait;
      if (isClosed) return;
      final status = progress
          .where((row) => row.lessonDay == day)
          .map((row) => row.status)
          .firstOrNull;
      emit(
        state.copyWith(
          program: Success(program),
          enrollment: enrollment,
          day: day,
          status: status,
          clearStatus: status == null,
          hasPlus: hasPlus,
          hasSensitiveConsent: hasSensitiveConsent,
        ),
      );
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(program: Failure.fromObject(exception)));
    }
  }

  /// Whether the account has Plus; a failed entitlement read leaves free content open.
  Future<bool> _hasPlus() async {
    try {
      return (await _plusRepository.getPlus()).hasPlus;
    } catch (_) {
      return false;
    }
  }

  /// Whether the sensitive tracks consent is on; a failed read keeps the lesson closed.
  Future<bool> _hasSensitiveConsent() async {
    try {
      return (await _privacyRepository.getConsents())[ConsentKind.sensitiveTracks] ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Records the sensitive tracks consent and opens the lesson in place.
  Future<bool> acceptSensitiveTracksConsent() async {
    if (state.action.isLoading) return false;

    emit(state.copyWith(action: const Loading()));
    try {
      await _privacyRepository.setConsent(ConsentKind.sensitiveTracks, granted: true);
      if (isClosed) return false;
      emit(state.copyWith(hasSensitiveConsent: true, action: const Success(null)));

      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return false;
    }
  }

  /// Marks the lesson done and moves the enrollment to the next day.
  Future<LessonOutcome> complete() async {
    final program = state.currentProgram;
    final lesson = state.lesson;
    if (program == null || lesson == null || state.action.isLoading) {
      return LessonOutcome.failed;
    }

    emit(state.copyWith(action: const Loading()));
    try {
      await _programsRepository.completeLesson(slug: program.slug, day: lesson.day);
      final nextLesson = program.nextLessonAfter(lesson);
      await _programsRepository.advanceProgram(
        slug: program.slug,
        currentDay: nextLesson?.day ?? lesson.day,
        completed: nextLesson == null,
      );
      if (isClosed) return LessonOutcome.failed;
      emit(state.copyWith(action: const Success(null), status: LessonStatus.done));

      return nextLesson == null ? LessonOutcome.completed : LessonOutcome.advanced;
    } catch (exception) {
      if (isClosed) return LessonOutcome.failed;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return LessonOutcome.failed;
    }
  }

  /// Keeps the lesson for later without moving the enrollment.
  ///
  /// A completed lesson stays done; saving never downgrades it.
  Future<bool> saveForLater() async {
    final program = state.currentProgram;
    final lesson = state.lesson;
    if (program == null ||
        lesson == null ||
        state.action.isLoading ||
        state.status == LessonStatus.done) {
      return false;
    }

    emit(state.copyWith(action: const Loading()));
    try {
      await _programsRepository.saveLesson(slug: program.slug, day: lesson.day);
      if (isClosed) return false;
      emit(state.copyWith(action: const Success(null), status: LessonStatus.saved));

      return true;
    } catch (exception) {
      if (isClosed) return false;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return false;
    }
  }
}
