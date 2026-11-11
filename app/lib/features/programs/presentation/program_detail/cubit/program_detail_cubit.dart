import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';

part 'program_detail_state.dart';

class ProgramDetailCubit({
  required final ProgramsRepository _programsRepository,
  required final PlusRepository _plusRepository,
  required final PrivacyRepository _privacyRepository,
}) extends Cubit<ProgramDetailState> {
  this : super(const ProgramDetailState());

  Future<void> load(String slug) async {
    if (state.program is! Success) emit(state.copyWith(program: const Loading()));
    try {
      final (hasPlus, hasSensitiveConsent, program, enrollment, progress) = await (
        _hasPlus(),
        _hasSensitiveConsent(),
        _programsRepository.getProgram(slug),
        _programsRepository.getEnrollment(slug),
        _programsRepository.getLessonProgress(slug),
      ).wait;
      if (isClosed) return;
      emit(
        state.copyWith(
          program: Success(program),
          enrollment: enrollment,
          doneDays: {
            for (final row in progress)
              if (row.status == LessonStatus.done) row.lessonDay,
          },
          savedDays: {
            for (final row in progress)
              if (row.status == LessonStatus.saved) row.lessonDay,
          },
          hasPlus: hasPlus,
          hasSensitiveConsent: hasSensitiveConsent,
        ),
      );
    } catch (exception) {
      if (isClosed || state.program is Success) return;
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

  /// Whether the sensitive tracks consent is on; a failed read keeps the track closed.
  Future<bool> _hasSensitiveConsent() async {
    try {
      return (await _privacyRepository.getConsents())[ConsentKind.sensitiveTracks] ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Records the sensitive tracks consent and opens the track in place.
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

  /// Starts or restarts the program and returns the lesson day to open.
  ///
  /// Returns null when the program is locked, has no lessons, or the write fails.
  Future<int?> start({bool restart = false}) async {
    final program = state.currentProgram;
    if (program == null || state.action.isLoading) return null;
    if (program.plusOnly && !state.hasPlus) return null;
    if (program.sensitive && !state.hasSensitiveConsent) return null;
    if (program.lessons.isEmpty) return null;

    emit(state.copyWith(action: const Loading()));
    try {
      final day = restart ? program.lessons.first.day : state.currentDay;
      if (state.enrollment == null) {
        await _programsRepository.startProgram(slug: program.slug, day: day);
      } else if (restart) {
        await _programsRepository.restartProgram(program.slug);
      }
      if (isClosed) return null;
      emit(state.copyWith(action: const Success(null)));

      return day;
    } catch (exception) {
      if (isClosed) return null;
      emit(state.copyWith(action: Failure.fromObject(exception)));
      emit(state.copyWith(action: const Initial()));

      return null;
    }
  }
}
