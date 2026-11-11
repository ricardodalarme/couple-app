part of 'programs_cubit.dart';

final class const ProgramsState({
  final Resource<List<Program>> programs = const Loading(),
  final bool hasPlus = false,
}) with Equatable {
  /// Whether the program needs Plus; the free plan still opens free programs.
  bool isLocked(Program program) => program.plusOnly && !hasPlus;

  ProgramsState copyWith({Resource<List<Program>>? programs, bool? hasPlus}) {
    return ProgramsState(programs: programs ?? this.programs, hasPlus: hasPlus ?? this.hasPlus);
  }

  @override
  List<Object?> get props => [programs, hasPlus];
}
