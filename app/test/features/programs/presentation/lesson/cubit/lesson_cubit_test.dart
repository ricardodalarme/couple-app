import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/cubit/lesson_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;

  const lessonOne = Lesson(slug: 'd1', title: 'Primeira', day: 1, body: 'Um obrigado.');
  const lessonTwo = Lesson(slug: 'd2', title: 'Segunda', day: 2, body: 'Seja específico.');
  const twoLessons = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    lessons: [lessonOne, lessonTwo],
  );
  const noLessons = Program(slug: 'grief-together', title: 'Luto, juntos', plusOnly: true);
  const spaced = Program(
    slug: 'spaced',
    title: 'Dias espaçados',
    lessons: [
      Lesson(slug: 's1', title: 'Primeira', day: 1),
      Lesson(slug: 's3', title: 'Terceira', day: 3),
    ],
  );

  setUp(() {
    repository = _MockProgramsRepository();
    plus = _MockPlusRepository();
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getProgram(any())).thenAnswer((_) async => twoLessons);
    when(
      () => repository.getEnrollment(any()),
    ).thenAnswer((_) async => const ProgramEnrollment(programSlug: 'gratitude-7', currentDay: 1));
    when(() => repository.getLessonProgress(any())).thenAnswer((_) async => []);
    when(
      () => repository.completeLesson(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.saveLesson(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.advanceProgram(
        slug: any(named: 'slug'),
        currentDay: any(named: 'currentDay'),
        completed: any(named: 'completed'),
      ),
    ).thenAnswer((_) async {});
  });

  LessonCubit build() => LessonCubit(programsRepository: repository, plusRepository: plus);

  test('the lesson reads its content and the first free day', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load(slug: 'gratitude-7', day: 1);

    expect(cubit.state.lesson?.title, 'Primeira');
    expect(cubit.state.isOpen, isTrue);
    expect(cubit.state.isMissing, isFalse);
  });

  test('a later lesson of a free program stays locked without Plus', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load(slug: 'gratitude-7', day: 2);

    expect(cubit.state.isOpen, isFalse);
  });

  test('completing a middle lesson moves the enrollment forward', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 1);

    final outcome = await cubit.complete();

    expect(outcome, LessonOutcome.advanced);
    verify(() => repository.completeLesson(slug: 'gratitude-7', day: 1)).called(1);
    verify(() => repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: false))
        .called(1);
  });

  test('completing the last lesson closes the program', () async {
    when(
      () => repository.getEnrollment(any()),
    ).thenAnswer((_) async => const ProgramEnrollment(programSlug: 'gratitude-7', currentDay: 2));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 2);

    final outcome = await cubit.complete();

    expect(outcome, LessonOutcome.completed);
    verify(() => repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: true))
        .called(1);
  });

  test('completing without an enrollment still advances it', () async {
    when(() => repository.getEnrollment(any())).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 1);

    final outcome = await cubit.complete();

    expect(outcome, LessonOutcome.advanced);
    verify(() => repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: false))
        .called(1);
  });

  test('the next lesson comes from the ordered lesson days', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => spaced);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'spaced', day: 1);

    await cubit.complete();

    verify(() => repository.advanceProgram(slug: 'spaced', currentDay: 3, completed: false))
        .called(1);
  });

  test('saving for later never moves the enrollment', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 1);

    final saved = await cubit.saveForLater();

    expect(saved, isTrue);
    verify(() => repository.saveLesson(slug: 'gratitude-7', day: 1)).called(1);
    verifyNever(
      () => repository.advanceProgram(
        slug: any(named: 'slug'),
        currentDay: any(named: 'currentDay'),
        completed: any(named: 'completed'),
      ),
    );
  });

  test('saving for later never downgrades a done lesson', () async {
    when(() => repository.getLessonProgress(any())).thenAnswer(
      (_) async => [
        const LessonProgress(programSlug: 'gratitude-7', lessonDay: 1, status: LessonStatus.done),
      ],
    );
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 1);

    final saved = await cubit.saveForLater();

    expect(saved, isFalse);
    expect(cubit.state.status, LessonStatus.done);
    verifyNever(
      () => repository.saveLesson(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    );
  });

  test('a failed entitlement read still opens the free lesson', () async {
    when(() => plus.getPlus()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load(slug: 'gratitude-7', day: 1);

    expect(cubit.state.currentProgram?.slug, 'gratitude-7');
    expect(cubit.state.isOpen, isTrue);
  });

  test('a program with no lessons has no lesson to open', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => noLessons);
    when(() => repository.getEnrollment(any())).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load(slug: 'grief-together', day: 1);

    expect(cubit.state.currentProgram?.lessonCount, 0);
    expect(cubit.state.lesson, isNull);
    expect(cubit.state.isMissing, isTrue);
  });

  test('a failed completion leaves the lesson open to try again', () async {
    when(
      () => repository.completeLesson(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(slug: 'gratitude-7', day: 1);

    final outcome = await cubit.complete();

    expect(outcome, LessonOutcome.failed);
    expect(cubit.state.action, isA<Initial>());
    expect(cubit.state.status, isNot(LessonStatus.done));
  });
}
