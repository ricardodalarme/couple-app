import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/plus/data/models/plus_state.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_bloc_starter/features/privacy/data/repositories/privacy_repository.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/cubit/lesson_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/lesson/lesson_page.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/program_detail/cubit/program_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/program_detail/program_detail_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _TestRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotFoundRoute.page, initial: true),
    AutoRoute(page: ProgramDetailRoute.page, path: '/program/:slug'),
    AutoRoute(page: LessonRoute.page, path: '/program/:slug/day/:day'),
    AutoRoute(page: ProgramCompleteRoute.page),
  ];
}

class _MockProgramsRepository() extends Mock implements ProgramsRepository;

class _MockPlusRepository() extends Mock implements PlusRepository;

class _MockPrivacyRepository() extends Mock implements PrivacyRepository;

void main() {
  late ProgramsRepository repository;
  late PlusRepository plus;
  late PrivacyRepository privacy;

  const lessonOne = Lesson(slug: 'd1', title: 'Perceba as pequenas coisas', day: 1);
  const lessonTwo = Lesson(slug: 'd2', title: 'Seja específico', day: 2);
  const free = Program(
    slug: 'gratitude-7',
    title: '7 dias de gratidão',
    body: 'Sete dias para perceber o que já existe.',
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
    body: 'Um caminho gentil para a perda.',
    sensitive: true,
    lessons: [lessonOne],
  );

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(ConsentKind.sensitiveTracks);
  });

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
      () => repository.completeLesson(
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
    when(
      () => repository.startProgram(
        slug: any(named: 'slug'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.restartProgram(any())).thenAnswer((_) async {});
  });

  Future<ProgramDetailCubit> loaded(String slug) async {
    final cubit = ProgramDetailCubit(
      programsRepository: repository,
      plusRepository: plus,
      privacyRepository: privacy,
    );
    addTearDown(cubit.close);
    await cubit.load(slug);

    return cubit;
  }

  testWidgets('a free program shows every lesson and how many exist', (tester) async {
    final cubit = await loaded('gratitude-7');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'gratitude-7'),
      ),
    );
    await tester.pump();

    expect(find.text('7 dias de gratidão'), findsWidgets);
    expect(find.text('2 lições'), findsOneWidget);
    expect(find.text('Perceba as pequenas coisas'), findsOneWidget);
    expect(find.text('Seja específico'), findsOneWidget);
    expect(find.text('Começar'), findsOneWidget);
    expect(find.textContaining('primeira lição'), findsOneWidget);
  });

  testWidgets('a sensitive program asks for its consent before any lesson', (tester) async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => sensitive);
    final cubit = await loaded('grief-together');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'grief-together'),
      ),
    );
    await tester.pump();

    expect(find.text('Uma trilha só sua'), findsOneWidget);
    expect(find.text('Entrar nesta trilha'), findsOneWidget);
    expect(find.text('O que ajuda hoje?'), findsNothing);
    expect(find.text('Começar'), findsNothing);
  });

  testWidgets('accepting the gate records the consent and reveals the lessons', (tester) async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => sensitive);
    when(() => privacy.setConsent(any(), granted: any(named: 'granted'))).thenAnswer((_) async {});
    final cubit = await loaded('grief-together');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'grief-together'),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Entrar nesta trilha'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    await tester.pump();

    expect(cubit.state.hasSensitiveConsent, isTrue);
    await tester.pump();
    expect(find.text('Perceba as pequenas coisas'), findsOneWidget);
    verify(() => privacy.setConsent(ConsentKind.sensitiveTracks, granted: true)).called(1);
  });

  testWidgets('a plus-only program explains the lock before starting', (tester) async {
    when(() => repository.getProgram(any())).thenAnswer((_) async => paid);
    final cubit = await loaded('reconnect-5');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'reconnect-5'),
      ),
    );
    await tester.pump();

    expect(find.text('Este programa faz parte do Plus.'), findsOneWidget);
    expect(find.text('Começar'), findsNothing);
  });

  testWidgets('a completed program is warm and offers a fresh start', (tester) async {
    when(() => repository.getEnrollment(any())).thenAnswer(
      (_) async => ProgramEnrollment(
        programSlug: 'gratitude-7',
        currentDay: 2,
        completedAt: DateTime(2026, 11, 10),
      ),
    );
    final cubit = await loaded('gratitude-7');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'gratitude-7'),
      ),
    );
    await tester.pump();

    expect(find.text('CONCLUÍDO'), findsOneWidget);
    expect(find.text('Começar de novo'), findsOneWidget);
    expect(find.textContaining('%'), findsNothing);
  });

  testWidgets('a plus reader does not see the first-lesson hint', (tester) async {
    when(() => plus.getPlus()).thenAnswer((_) async => const PlusState(hasPlus: true));
    final cubit = await loaded('gratitude-7');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'gratitude-7'),
      ),
    );
    await tester.pump();

    expect(find.textContaining('primeira lição'), findsNothing);
  });

  testWidgets('starting over asks before clearing lesson marks', (tester) async {
    when(() => repository.getEnrollment(any())).thenAnswer(
      (_) async => ProgramEnrollment(
        programSlug: 'gratitude-7',
        currentDay: 2,
        completedAt: DateTime(2026, 11, 10),
      ),
    );
    final cubit = await loaded('gratitude-7');

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const ProgramDetailPage(slug: 'gratitude-7'),
      ),
    );
    await tester.pump();
    await tester.tap(find.text('Começar de novo'));
    await tester.pumpAndSettle();

    expect(find.text('Começar de novo?'), findsOneWidget);
    expect(find.text('Isto limpa suas marcações e volta à primeira lição.'), findsOneWidget);
    verifyNever(() => repository.restartProgram(any()));
  });

  testWidgets('opening a lesson from the list and completing it advances the program', (
    tester,
  ) async {
    final detailCubit = ProgramDetailCubit(
      programsRepository: repository,
      plusRepository: plus,
      privacyRepository: privacy,
    );
    await detailCubit.load('gratitude-7');
    final lessonCubit = LessonCubit(
      programsRepository: repository,
      plusRepository: plus,
      privacyRepository: privacy,
    );
    await lessonCubit.load(slug: 'gratitude-7', day: 1);
    AppInjector.instance.registerFactory<ProgramDetailCubit>(() => detailCubit);
    AppInjector.instance.registerFactory<LessonCubit>(() => lessonCubit);
    addTearDown(() {
      AppInjector.instance.unregister<ProgramDetailCubit>();
      AppInjector.instance.unregister<LessonCubit>();
    });

    final router = _TestRouter();
    await tester.pumpWidget(
      TranslationProvider(
        child: AppThemeHost(
          initialVariant: AppThemeVariant.rose,
          child: Builder(
            builder: (context) => BaseApp.router(
              routerConfig: router.config(),
              theme: AppTheme.light(AppThemeScope.of(context)),
              supportedLocales: AppLocaleUtils.supportedLocales,
            ),
          ),
        ),
      ),
    );
    unawaited(router.push(ProgramDetailRoute(slug: 'gratitude-7')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    await tester.tap(find.text('Perceba as pequenas coisas'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(LessonPage), findsOneWidget);

    await tester.tap(find.text('Pronto'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    verify(() => repository.completeLesson(slug: 'gratitude-7', day: 1)).called(1);
    verify(() => repository.advanceProgram(slug: 'gratitude-7', currentDay: 2, completed: false))
        .called(1);
  });
}
