import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/programs_data_source.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:logger/logger.dart';

class ProgramsRepository({
  required final ProgramsDataSource _dataSource,
  required final ProfileRepository _profileRepository,
}) {
  final Logger _logger = Logger('ProgramsRepository');

  /// The programs and lessons that exist for the account language, in position order.
  Future<List<Program>> getPrograms() => _run('read the programs', () async {
    final record = await _dataSource.getPrograms(await _locale());

    return _programs(record);
  });

  Future<Program> getProgram(String slug) => _run('read one program', () async {
    final record = await _dataSource.getProgram(slug: slug, locale: await _locale());
    final program = record.program;
    if (program == null) throw StateError('Program $slug is missing');

    return Program(
      slug: program.slug,
      title: program.title,
      body: program.body,
      plusOnly: program.plusOnly,
      lessons: _lessons(record),
    );
  });

  Future<ProgramEnrollment?> getEnrollment(String slug) => _run(
    'read the program enrollment',
    () async => switch (await _dataSource.getEnrollment(slug)) {
      final enrollment? => ProgramEnrollment(
        programSlug: enrollment.programSlug,
        currentDay: enrollment.currentDay,
        completedAt: enrollment.completedAt,
      ),
      null => null,
    },
  );

  Future<List<LessonProgress>> getLessonProgress(String slug) => _run(
    'read the lesson progress',
    () async => [
      for (final row in await _dataSource.getLessonProgress(slug))
        LessonProgress(
          programSlug: row.programSlug,
          lessonDay: row.lessonDay,
          status: LessonStatus.fromServer(row.status),
        ),
    ],
  );

  Future<void> startProgram({required String slug, required int day}) => _run(
    'start the program',
    () => _dataSource.insertEnrollment(programSlug: slug, currentDay: day),
  );

  /// Moves the enrollment forward, creating it when the person started from a lesson.
  ///
  /// Marks the enrollment complete on the final lesson.
  Future<void> advanceProgram({
    required String slug,
    required int currentDay,
    required bool completed,
  }) => _run('advance the program', () async {
    final completedAt = completed ? DateTime.now() : null;
    final advanced = completed
        ? await _dataSource.completeEnrollment(
            programSlug: slug,
            currentDay: currentDay,
            completedAt: completedAt!,
          )
        : await _dataSource.updateEnrollment(programSlug: slug, currentDay: currentDay);
    if (advanced) return;

    await _dataSource.insertEnrollment(
      programSlug: slug,
      currentDay: currentDay,
      completedAt: completedAt,
    );
  });

  /// Clears the lesson marks and returns the enrollment to the first lesson.
  Future<void> restartProgram(String slug) => _run('restart the program', () async {
    await _dataSource.clearLessonProgress(slug);
    await _dataSource.restartEnrollment(slug);
  });

  Future<void> completeLesson({required String slug, required int day}) => _run(
    'mark the lesson done',
    () => _dataSource.setLessonStatus(
      programSlug: slug,
      lessonDay: day,
      status: LessonStatus.done.toServer,
    ),
  );

  Future<void> saveLesson({required String slug, required int day}) => _run(
    'save the lesson',
    () => _dataSource.setLessonStatus(
      programSlug: slug,
      lessonDay: day,
      status: LessonStatus.saved.toServer,
    ),
  );

  Future<List<DiaryEntry>> getDiaryEntries() => _run(
    'read the diary',
    () async => [
      for (final entry in await _dataSource.getJournalEntries())
        DiaryEntry(id: entry.id, entryDate: entry.entryDate, body: entry.body, mood: entry.mood),
    ],
  );

  /// Inserts the first entry for a day, or replaces [id] when it already exists.
  Future<String> saveDiaryEntry({
    required DateTime entryDate,
    required String body,
    String? mood,
    String? id,
  }) => _run('save a diary entry', () async {
    if (id != null) {
      await _dataSource.updateJournalEntry(id: id, body: body, mood: mood);

      return id;
    }
    final entry = await _dataSource.insertJournalEntry(
      entryDate: entryDate,
      body: body,
      mood: mood,
    );

    return entry.id;
  });

  Future<void> deleteDiaryEntry(String id) =>
      _run('delete a diary entry', () => _dataSource.deleteJournalEntry(id));

  Future<String> _locale() async => (await _profileRepository.getMySettings()).locale;

  List<Program> _programs(ProgramsRecord record) {
    final lessonsByParent = <String, List<ProgramLessonDraft>>{};
    for (final lesson in record.lessons) {
      final parent = lesson.parentSlug;
      if (parent == null) continue;
      lessonsByParent.putIfAbsent(parent, () => []).add((lesson: lesson, day: lesson.position));
    }

    final programs = [
      for (final program in record.programs)
        (
          program: program,
          lessons: [...?lessonsByParent[program.slug]]..sort((a, b) => a.day.compareTo(b.day)),
        ),
    ]..sort((a, b) => a.program.position.compareTo(b.program.position));

    return [
      for (final entry in programs)
        Program(
          slug: entry.program.slug,
          title: entry.program.title,
          body: entry.program.body,
          plusOnly: entry.program.plusOnly,
          lessons: [for (final lesson in entry.lessons) _lesson(lesson)],
        ),
    ];
  }

  List<Lesson> _lessons(ProgramRecord record) {
    final lessons = [for (final lesson in record.lessons) (lesson: lesson, day: lesson.position)]
      ..sort((a, b) => a.day.compareTo(b.day));

    return [for (final lesson in lessons) _lesson(lesson)];
  }

  Lesson _lesson(ProgramLessonDraft draft) => Lesson(
    slug: draft.lesson.slug,
    title: draft.lesson.title,
    day: draft.day,
    body: draft.lesson.body,
    plusOnly: draft.lesson.plusOnly,
  );

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}

typedef ProgramLessonDraft = ({ContentItemRecord lesson, int day});
