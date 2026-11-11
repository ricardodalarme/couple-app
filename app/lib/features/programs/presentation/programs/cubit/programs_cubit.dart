import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';

part 'programs_state.dart';

class ProgramsCubit({
  required final ProgramsRepository _programsRepository,
  required final PlusRepository _plusRepository,
}) extends Cubit<ProgramsState> {
  this : super(const ProgramsState());

  /// Whether the account has Plus; a failed entitlement read leaves programs open.
  Future<bool> _hasPlus() async {
    try {
      return (await _plusRepository.getPlus()).hasPlus;
    } catch (_) {
      return false;
    }
  }

  /// Reads what the account has and the programs that exist for its language.
  Future<void> load() async {
    if (state.programs is! Success) emit(state.copyWith(programs: const Loading()));
    try {
      final (hasPlus, programs) = await (_hasPlus(), _programsRepository.getPrograms()).wait;
      if (isClosed) return;
      emit(state.copyWith(programs: Success(programs), hasPlus: hasPlus));
    } catch (exception) {
      if (isClosed || state.programs is Success) return;
      emit(state.copyWith(programs: Failure.fromObject(exception)));
    }
  }
}
