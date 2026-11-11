import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';

part 'program_detail_state.dart';

class ProgramDetailCubit({
  required final ProgramsRepository _programsRepository,
  required final PlusRepository _plusRepository,
}) extends Cubit<ProgramDetailState> {
  this : super(const ProgramDetailState());

  Future<void> load(String slug) async {
    if (state.program is! Success) emit(state.copyWith(program: const Loading()));
    try {
      final (hasPlus, program, enrollment, progress) = await (
        _hasPlus(),
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

  /// Starts or restarts the program and returns the lesson day to open.
  ///
  /// Returns null when the program is locked, has no lessons, or the write fails.
  Future<int?> start({bool restart = false}) async {
    final program = state.currentProgram;
    if (program == null || state.action.isLoading) return null;
    if (program.plusOnly && !state.hasPlus) return null;
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
