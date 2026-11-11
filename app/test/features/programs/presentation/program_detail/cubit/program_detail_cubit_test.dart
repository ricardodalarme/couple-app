import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/program_detail/cubit/program_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

class _MockPrivacyRepository() extends Mock implements PrivacyRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;
  late PrivacyRepository privacy;

  const lessonOne = Lesson(slug: 'd1', title: 'Primeira', day: 1, body: 'Um obrigado.');
  const lessonTwo = Lesson(slug: 'd2', title: 'Segunda', day: 2, body: 'Seja específico.');
  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    lessons: [lessonOne, lessonTwo],
  );
  const paid = Program(
    slug: 'reconnect-5',
    title: 'Reencontro',
    plusOnly: true,
    lessons: [lessonOne],
  );
  const sensitive = Program(
    slug: 'grief-together',
    title: 'Luto, juntos',
    sensitive: true,
    lessons: [lessonOne],
  );

  setUpAll(() => registerFallbackValue(ConsentKind.sensitiveTracks));

  setUp(() {
    repository = _MockProgramsRepository();
    plus = _MockPlusRepository();
    privacy = _MockPrivacyRepository();
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => privacy.getConsents()).thenAnswer((_) async => {});
    when(() => repository.getProgram(any())).thenAnswer((_) async => free);
    when(() => repository.getEnrollment(any())).thenAnswer((_) async => null);
    when(() => repository.getLessonProgress(any())).thenAnswer((_) async => []);
    when(
      () => repository.startProgram(
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
    when(() => repository.restartProgram(any())).thenAnswer((_) async {});
  });

  ProgramDetailCubit build() => ProgramDetailCubit(
    programsRepository: repository,
    plusRepository: plus,
    privacyRepository: privacy,
  );

  test('the detail reads the program, where the person is and what is done', () async {
    when(
      () => repository.getEnrollment('gratitude-7'),
    ).thenAnswer((_) async => const ProgramEnrollment(programSlug: 'gratitude-7', currentDay: 2));
    when(() => repository.getLessonProgress('gratitude-7')).thenAnswer(
      (_) async => [
        const LessonProgress(programSlug: 'gratitude-7', lessonDay: 1, status: LessonStatus.done),
        const LessonProgress(programSlug: 'gratitude-7', lessonDay: 2, status: LessonStatus.saved),
      ],
    );
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load('gratitude-7');

    expect(cubit.state.currentProgram?.lessonCount, 2);
    expect(cubit.state.currentDay, 2);
    expect(cubit.state.doneDays, {1});
    expect(cubit.state.savedDays, {2});
  });

  test('a failed entitlement read still opens the free program', () async {
    when(() => plus.getPlus()).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load('gratitude-7');

    expect(cubit.state.currentProgram?.slug, 'gratitude-7');
    expect(cubit.state.hasPlus, isFalse);
  });

  test('starting a program inserts the enrollment on day one', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('gratitude-7');

    final day = await cubit.start();

    expect(day, 1);
    verify(() => repository.startProgram(slug: 'gratitude-7', day: 1)).called(1);
  });

  test('continuing opens the current day without writing again', () async {
    when(
      () => repository.getEnrollment('gratitude-7'),
    ).thenAnswer((_) async => const ProgramEnrollment(programSlug: 'gratitude-7', currentDay: 2));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('gratitude-7');

    final day = await cubit.start();

    expect(day, 2);
    verifyNever(
      () => repository.startProgram(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    );
  });

  test('restarting returns to day one and clears the completion', () async {
    when(() => repository.getEnrollment('gratitude-7')).thenAnswer(
      (_) async => ProgramEnrollment(
        programSlug: 'gratitude-7',
        currentDay: 2,
        completedAt: DateTime(2026, 11, 10),
      ),
    );
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('gratitude-7');

    final day = await cubit.start(restart: true);

    expect(day, 1);
    verify(() => repository.restartProgram('gratitude-7')).called(1);
  });

  test('a plus-only program never starts for the free plan', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => paid);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('reconnect-5');

    final day = await cubit.start();

    expect(day, isNull);
    verifyNever(
      () => repository.startProgram(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    );
  });

  test('a sensitive program never starts without its consent', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => sensitive);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('grief-together');

    final day = await cubit.start();

    expect(day, isNull);
    verifyNever(
      () => repository.startProgram(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    );
  });

  test('a sensitive program starts once the consent is recorded', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => sensitive);
    when(() => privacy.getConsents()).thenAnswer((_) async => {ConsentKind.sensitiveTracks: true});
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('grief-together');

    final day = await cubit.start();

    expect(day, 1);
  });

  test('accepting the sensitive consent records it and opens the track', () async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => sensitive);
    when(() => privacy.setConsent(any(), granted: any(named: 'granted'))).thenAnswer((_) async {});
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('grief-together');

    expect(cubit.state.hasSensitiveConsent, isFalse);
    final accepted = await cubit.acceptSensitiveTracksConsent();

    expect(accepted, isTrue);
    expect(cubit.state.hasSensitiveConsent, isTrue);
    verify(() => privacy.setConsent(ConsentKind.sensitiveTracks, granted: true)).called(1);
  });

  test('a failed start keeps the screen and clears the action', () async {
    when(
      () => repository.startProgram(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('gratitude-7');

    final day = await cubit.start();

    expect(day, isNull);
    expect(cubit.state.action, isA<Initial>());
  });
}
