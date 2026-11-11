import 'package:equatable/equatable.dart';

/// A guided program and the lessons that exist for it.
final class const Program({
  required final String slug,
  required final String title,
  final String? body,
  final bool plusOnly = false,
  final List<Lesson> lessons = const [],
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => Program(
    slug: 'fake',
    title: 'Um programa curto',
    body: 'Uma ideia por dia, no seu ritmo.',
    lessons: [Lesson.fake()],
  );

  int get lessonCount => lessons.length;

  Lesson? lessonForDay(int day) => lessons.where((lesson) => lesson.day == day).firstOrNull;

  /// The first lesson of a free program is always open; every other lesson needs Plus.
  bool isLessonOpen({required bool hasPlus, required Lesson lesson}) =>
      hasPlus || (!plusOnly && lessons.isNotEmpty && lesson.slug == lessons.first.slug);

  /// The next lesson after [lesson] in list order, or null when it is the last one.
  Lesson? nextLessonAfter(Lesson lesson) {
    final index = lessons.indexWhere((row) => row.slug == lesson.slug);
    if (index < 0 || index + 1 >= lessons.length) return null;

    return lessons[index + 1];
  }

  @override
  List<Object?> get props => [slug, title, body, plusOnly, lessons];
}

/// One day of a program.
final class const Lesson({
  required final String slug,
  required final String title,
  required final int day,
  final String? body,
  final bool plusOnly = false,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => const Lesson(
    slug: 'fake-day-1',
    title: 'Perceba as pequenas coisas',
    day: 1,
    body: 'Tente isto hoje: diga um obrigado em voz alta.',
  );

  @override
  List<Object?> get props => [slug, title, day, body, plusOnly];
}

/// How far the person is in a program.
final class const ProgramEnrollment({
  required final String programSlug,
  required final int currentDay,
  final DateTime? completedAt,
}) with Equatable {
  bool get isCompleted => completedAt != null;

  @override
  List<Object?> get props => [programSlug, currentDay, completedAt];
}

/// What the person did with one lesson; saving is not completing.
enum LessonStatus() {
  done,
  saved;

  static LessonStatus fromServer(String value) => switch (value) {
    'done' => done,
    'saved' => saved,
    _ => throw UnimplementedError('Unknown lesson status $value'),
  };

  String get toServer => switch (this) {
    done => 'done',
    saved => 'saved',
  };
}

/// The person's own marker for one lesson.
final class const LessonProgress({
  required final String programSlug,
  required final int lessonDay,
  required final LessonStatus status,
}) with Equatable {
  @override
  List<Object?> get props => [programSlug, lessonDay, status];
}
