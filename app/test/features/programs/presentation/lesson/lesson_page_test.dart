import 'package:core/core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/cubit/lesson_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/lesson_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;

  const lessonOne = Lesson(
    slug: 'd1',
    title: 'Perceba as pequenas coisas',
    day: 1,
    body: 'Tente isto hoje: diga um obrigado em voz alta.',
  );
  const lessonTwo = Lesson(slug: 'd2', title: 'Seja específico', day: 2);
  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    lessons: [lessonOne, lessonTwo],
  );
  const noLessons = Program(slug: 'grief-together', title: 'Luto, juntos', plusOnly: true);

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() {
    repository = _MockProgramsRepository();
    plus = _MockPlusRepository();
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: false));
    when(() => repository.getProgram(any())).thenAnswer((_) async => free);
    when(
      () => repository.getEnrollment(any()),
    ).thenAnswer((_) async => const ProgramEnrollment(programSlug: 'gratitude-7', currentDay: 1));
    when(() => repository.getLessonProgress(any())).thenAnswer((_) async => []);
  });

  Future<LessonCubit> loaded(String slug, int day) async {
    final cubit = LessonCubit(programsRepository: repository, plusRepository: plus);
    addTearDown(cubit.close);
    await cubit.load(slug: slug, day: day);

    return cubit;
  }

  testWidgets('a lesson shows only its content, with no false duration', (tester) async {
    final cubit = await loaded('gratitude-7', 1);
    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (
      call,
    ) async {
      calls.add(call);

      return null;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'gratitude-7', day: 1),
      ),
    );
    await tester.pump();

    expect(find.text('7 dias de gratidão'), findsOneWidget);
    expect(find.text('Dia 1'), findsOneWidget);
    expect(find.text('Perceba as pequenas coisas'), findsOneWidget);
    expect(find.text('Tente isto hoje: diga um obrigado em voz alta.'), findsOneWidget);
    expect(find.text('Pronto'), findsOneWidget);
    expect(find.text('Salvar para depois'), findsOneWidget);
    expect(find.textContaining('2 minutos'), findsNothing);
    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });

  testWidgets('a locked later lesson points to the plans', (tester) async {
    final cubit = await loaded('gratitude-7', 2);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'gratitude-7', day: 2),
      ),
    );
    await tester.pump();

    expect(find.text('Lição do Plus'), findsOneWidget);
    expect(find.text('Ver o Plus'), findsOneWidget);
    expect(find.text('Pronto'), findsNothing);
  });

  testWidgets('a program without lessons stays calm instead of faking one', (tester) async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => noLessons);
    when(() => repository.getEnrollment(any())).thenAnswer((_) async => null);
    final cubit = await loaded('grief-together', 1);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'grief-together', day: 1),
      ),
    );
    await tester.pump();

    expect(find.text('Lições chegando'), findsOneWidget);
    expect(find.text('Pronto'), findsNothing);
  });

  testWidgets('a day that no longer exists is not presented as coming soon', (tester) async {
    final cubit = await loaded('gratitude-7', 9);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'gratitude-7', day: 9),
      ),
    );
    await tester.pump();

    expect(find.text('Lição indisponível'), findsOneWidget);
    expect(find.text('Lições chegando'), findsNothing);
  });

  testWidgets('a saved lesson shows its marker', (tester) async {
    when(() => repository.getLessonProgress(any())).thenAnswer(
      (_) async => [
        const LessonProgress(programSlug: 'gratitude-7', lessonDay: 1, status: LessonStatus.saved),
      ],
    );
    final cubit = await loaded('gratitude-7', 1);
    expect(cubit.state.status, LessonStatus.saved);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'gratitude-7', day: 1),
      ),
    );
    await tester.pump();

    expect(find.text('GUARDADO'), findsOneWidget);
  });

  testWidgets('a failed completion uses the program retry copy', (tester) async {
    when(
      () => repository.completeLesson(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = await loaded('gratitude-7', 1);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const LessonPage(slug: 'gratitude-7', day: 1),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Pronto'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Não deu para fazer isso agora. Tente de novo.'), findsOneWidget);

    await tester.pump(const Duration(seconds: 7));
  });
}
