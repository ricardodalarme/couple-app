part of 'lesson_cubit.dart';

final class const LessonState({
  final Resource<Program> program = const Loading(),
  final ProgramEnrollment? enrollment,
  final int day = 1,
  final LessonStatus? status,
  final bool hasPlus = false,
  final bool hasSensitiveConsent = false,
  final Resource<void> action = const Initial(),
}) with Equatable {
  Program? get currentProgram => switch (program) {
    Success(:final value) => value,
    _ => null,
  };

  Lesson? get lesson => currentProgram?.lessonForDay(day);

  /// Whether the content still has the lesson the route asked for.
  bool get isMissing => currentProgram != null && lesson == null;

  bool get isOpen {
    final program = currentProgram;
    final lesson = this.lesson;

    return program != null &&
        lesson != null &&
        (!program.sensitive || hasSensitiveConsent) &&
        program.isLessonOpen(hasPlus: hasPlus, lesson: lesson);
  }

  LessonState copyWith({
    Resource<Program>? program,
    ProgramEnrollment? enrollment,
    int? day,
    LessonStatus? status,
    bool clearStatus = false,
    bool? hasPlus,
    bool? hasSensitiveConsent,
    Resource<void>? action,
  }) {
    return LessonState(
      program: program ?? this.program,
      enrollment: enrollment ?? this.enrollment,
      day: day ?? this.day,
      status: clearStatus ? null : (status ?? this.status),
      hasPlus: hasPlus ?? this.hasPlus,
      hasSensitiveConsent: hasSensitiveConsent ?? this.hasSensitiveConsent,
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [
    program,
    enrollment,
    day,
    status,
    hasPlus,
    hasSensitiveConsent,
    action,
  ];
}
