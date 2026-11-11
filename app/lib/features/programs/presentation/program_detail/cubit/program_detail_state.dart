part of 'program_detail_cubit.dart';

final class const ProgramDetailState({
  final Resource<Program> program = const Loading(),
  final ProgramEnrollment? enrollment,
  final Set<int> doneDays = const {},
  final Set<int> savedDays = const {},
  final bool hasPlus = false,
  final Resource<void> action = const Initial(),
}) with Equatable {
  Program? get currentProgram => switch (program) {
    Success(:final value) => value,
    _ => null,
  };

  bool get isCompleted => enrollment?.isCompleted ?? false;

  /// The lesson day the continue action opens; the first lesson before starting.
  int get currentDay {
    final program = currentProgram;
    if (program == null || program.lessons.isEmpty) return 1;
    final day = enrollment?.currentDay;
    if (day == null || day <= program.lessons.first.day) return program.lessons.first.day;
    if (program.lessonForDay(day) != null) return day;

    return program.lessons.where((lesson) => lesson.day > day).firstOrNull?.day ??
        program.lessons.last.day;
  }

  ProgramDetailState copyWith({
    Resource<Program>? program,
    ProgramEnrollment? enrollment,
    Set<int>? doneDays,
    Set<int>? savedDays,
    bool? hasPlus,
    Resource<void>? action,
  }) {
    return ProgramDetailState(
      program: program ?? this.program,
      enrollment: enrollment ?? this.enrollment,
      doneDays: doneDays ?? this.doneDays,
      savedDays: savedDays ?? this.savedDays,
      hasPlus: hasPlus ?? this.hasPlus,
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [program, enrollment, doneDays, savedDays, hasPlus, action];
}
