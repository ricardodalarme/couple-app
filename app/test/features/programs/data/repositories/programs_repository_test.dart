import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/data_sources/programs_data_source.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsDataSource() extends Mock implements ProgramsDataSource;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late ProgramsDataSource dataSource;
  late ProgramsRepository repository;

  ContentItemRecord programRecord(
    String slug,
    int position, {
    bool plusOnly = false,
    bool sensitive = false,
    String? body = 'Um caminho curto.',
  }) => (
    slug: slug,
    title: slug,
    body: body,
    parentSlug: null,
    position: position,
    plusOnly: plusOnly,
    sensitive: sensitive,
  );

  ContentItemRecord lessonRecord(
    String slug,
    String programSlug,
    int day, {
    bool plusOnly = false,
    bool sensitive = false,
  }) => (
    slug: slug,
    title: slug,
    body: 'Uma ideia para o dia $day.',
    parentSlug: programSlug,
    position: day,
    plusOnly: plusOnly,
    sensitive: sensitive,
  );

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    dataSource = _MockProgramsDataSource();
    final profile = _MockProfileRepository();
    when(profile.getMySettings)
        .thenAnswer((_) async => const AccountSettings(theme: .rose, locale: 'pt-BR'));
    repository = ProgramsRepository(dataSource: dataSource, profileRepository: profile);
  });

  test('programs keep their position order and each lesson belongs to its program', () async {
    when(() => dataSource.getPrograms('pt-BR')).thenAnswer(
      (_) async => (
        programs: [
          programRecord('reconnect-5', 3, plusOnly: true),
          programRecord('gratitude-7', 1),
        ],
        lessons: [
          lessonRecord('gratitude-7-d2', 'gratitude-7', 2, plusOnly: true),
          lessonRecord('reconnect-5-d1', 'reconnect-5', 1),
          lessonRecord('gratitude-7-d1', 'gratitude-7', 1),
        ],
      ),
    );

    final programs = await repository.getPrograms();

    expect(programs.map((program) => program.slug), ['gratitude-7', 'reconnect-5']);
    expect(programs.first.lessons.map((lesson) => lesson.day), [1, 2]);
    expect(programs.first.lessonCount, 2);
    expect(programs.first.sensitive, isFalse);
    expect(programs.last.lessons.single.slug, 'reconnect-5-d1');
  });

  test('a sensitive program keeps the flag after the read', () async {
    when(() => dataSource.getPrograms('pt-BR')).thenAnswer(
      (_) async => (
        programs: [programRecord('grief-together', 10, sensitive: true)],
        lessons: [lessonRecord('grief-together-d1', 'grief-together', 1, sensitive: true)],
      ),
    );

    final programs = await repository.getPrograms();

    expect(programs.single.sensitive, isTrue);
    expect(programs.single.lessons.single.slug, 'grief-together-d1');
  });

  test('a language without programs stays empty instead of borrowing another one', () async {
    when(() => dataSource.getPrograms('pt-BR'))
        .thenAnswer((_) async => (programs: <ContentItemRecord>[], lessons: <ContentItemRecord>[]));

    expect(await repository.getPrograms(), isEmpty);
  });

  test('one program is read in the account language', () async {
    when(() => dataSource.getProgram(slug: 'gratitude-7', locale: 'pt-BR')).thenAnswer(
      (_) async => (
        program: programRecord('gratitude-7', 1, body: 'Sete dias de gratidão.'),
        lessons: [
          lessonRecord('gratitude-7-d2', 'gratitude-7', 2),
          lessonRecord('gratitude-7-d1', 'gratitude-7', 1),
        ],
      ),
    );

    final program = await repository.getProgram('gratitude-7');

    expect(program.body, 'Sete dias de gratidão.');
    expect(program.lessons.map((lesson) => lesson.day), [1, 2]);
    verify(() => dataSource.getProgram(slug: 'gratitude-7', locale: 'pt-BR')).called(1);
  });

  test('a missing program is a failure, never invented content', () async {
    when(
      () => dataSource.getProgram(
        slug: any(named: 'slug'),
        locale: any(named: 'locale'),
      ),
    ).thenAnswer((_) async => (program: null, lessons: const <ContentItemRecord>[]));

    await expectLater(repository.getProgram('missing'), throwsStateError);
  });

  test('enrollment and lesson progress reach the domain models', () async {
    when(() => dataSource.getEnrollment('gratitude-7')).thenAnswer(
      (_) async => (programSlug: 'gratitude-7', currentDay: 2, completedAt: DateTime(2026, 11, 10)),
    );
    when(() => dataSource.getLessonProgress('gratitude-7')).thenAnswer(
      (_) async => [
        (programSlug: 'gratitude-7', lessonDay: 1, status: 'done'),
        (programSlug: 'gratitude-7', lessonDay: 2, status: 'saved'),
      ],
    );

    final enrollment = await repository.getEnrollment('gratitude-7');
    final progress = await repository.getLessonProgress('gratitude-7');

    expect(enrollment?.currentDay, 2);
    expect(enrollment?.isCompleted, isTrue);
    expect(progress.map((row) => row.status), [LessonStatus.done, LessonStatus.saved]);
  });

  test('starting, advancing and completing write the enrollment', () async {
    when(
      () => dataSource.insertEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => dataSource.updateEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
      ),
    ).thenAnswer((_) async => true);
    when(
      () => dataSource.completeEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
        completedAt: any(named: 'completedAt'),
      ),
    ).thenAnswer((_) async => true);
    when(() => dataSource.restartEnrollment(any())).thenAnswer((_) async {});
    when(() => dataSource.clearLessonProgress(any())).thenAnswer((_) async {});

    await repository.startProgram(slug: 'gratitude-7', day: 1);
    await repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: false);
    await repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: true);
    await repository.restartProgram('gratitude-7');

    verify(() => dataSource.insertEnrollment(programSlug: 'gratitude-7', currentDay: 1)).called(1);
    verify(() => dataSource.updateEnrollment(programSlug: 'gratitude-7', currentDay: 2)).called(1);
    verify(
      () => dataSource.completeEnrollment(
        programSlug: 'gratitude-7',
        currentDay: 2,
        completedAt: any(named: 'completedAt'),
      ),
    ).called(1);
    verify(() => dataSource.clearLessonProgress('gratitude-7')).called(1);
    verify(() => dataSource.restartEnrollment('gratitude-7')).called(1);
  });

  test('advancing without an enrollment inserts it instead of losing the completion', () async {
    when(
      () => dataSource.updateEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
      ),
    ).thenAnswer((_) async => false);
    when(
      () => dataSource.insertEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
        completedAt: any(named: 'completedAt'),
      ),
    ).thenAnswer((_) async {});

    await repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: false);

    verify(
      () =>
          dataSource.insertEnrollment(programSlug: 'gratitude-7', currentDay: 2, completedAt: null),
    ).called(1);
  });

  test('completing without an enrollment inserts a completed enrollment', () async {
    when(
      () => dataSource.completeEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
        completedAt: any(named: 'completedAt'),
      ),
    ).thenAnswer((_) async => false);
    when(
      () => dataSource.insertEnrollment(
        programSlug: any(named: 'programSlug'),
        currentDay: any(named: 'currentDay'),
        completedAt: any(named: 'completedAt'),
      ),
    ).thenAnswer((_) async {});

    await repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: true);

    verify(
      () => dataSource.insertEnrollment(
        programSlug: 'gratitude-7',
        currentDay: 2,
        completedAt: any(named: 'completedAt'),
      ),
    ).called(1);
  });

  test('completing a lesson differs from saving it', () async {
    when(
      () => dataSource.setLessonStatus(
        programSlug: any(named: 'programSlug'),
        lessonDay: any(named: 'lessonDay'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});

    await repository.completeLesson(slug: 'gratitude-7', day: 1);
    await repository.saveLesson(slug: 'gratitude-7', day: 2);

    verify(
      () => dataSource.setLessonStatus(programSlug: 'gratitude-7', lessonDay: 1, status: 'done'),
    ).called(1);
    verify(
      () => dataSource.setLessonStatus(programSlug: 'gratitude-7', lessonDay: 2, status: 'saved'),
    ).called(1);
  });

  test('diary reads, inserts, updates and deletes only the person rows', () async {
    when(() => dataSource.getJournalEntries()).thenAnswer(
      (_) async => [
        (id: 'j1', entryDate: DateTime(2026, 11, 10), body: 'Hoje foi calmo.', mood: 'calm'),
      ],
    );
    when(
      () => dataSource.insertJournalEntry(
        entryDate: any(named: 'entryDate'),
        body: any(named: 'body'),
        mood: null,
      ),
    ).thenAnswer(
      (_) async => (id: 'j2', entryDate: DateTime(2026, 11, 11), body: 'Novo.', mood: null),
    );
    when(
      () => dataSource.updateJournalEntry(
        id: any(named: 'id'),
        body: any(named: 'body'),
        mood: null,
      ),
    ).thenAnswer((_) async {});
    when(() => dataSource.deleteJournalEntry(any())).thenAnswer((_) async {});

    final entries = await repository.getDiaryEntries();
    final id = await repository.saveDiaryEntry(entryDate: DateTime(2026, 11, 11), body: 'Novo.');
    await repository.saveDiaryEntry(entryDate: DateTime(2026, 11, 11), body: 'Editado.', id: id);
    await repository.deleteDiaryEntry(id);

    expect(entries.single.body, 'Hoje foi calmo.');
    expect(id, 'j2');
    verify(
      () => dataSource.insertJournalEntry(
        entryDate: DateTime(2026, 11, 11),
        body: 'Novo.',
        mood: null,
      ),
    ).called(1);
    verify(() => dataSource.updateJournalEntry(id: 'j2', body: 'Editado.', mood: null)).called(1);
    verify(() => dataSource.deleteJournalEntry('j2')).called(1);
  });
}
