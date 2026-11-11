import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/guide_session.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_catalogue.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/cubit/guide_cubit.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/guide_page.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/cubit/soft_start_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/soft_start_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockGuidesRepository() extends Mock implements GuidesRepository;

class _TestRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotFoundRoute.page, initial: true),
    AutoRoute(page: GuideRoute.page, path: '/guide/:slug', fullscreenDialog: true),
    AutoRoute(page: SoftStartRoute.page, path: '/soft-start', fullscreenDialog: true),
  ];
}

void main() {
  late GuidesRepository repository;

  final money = guideCatalogue.firstWhere((guide) => guide.slug == 'money').localized('pt');
  final intimacy = guideCatalogue.firstWhere((guide) => guide.slug == 'intimacy').localized('pt');
  final cycle = guideCatalogue.firstWhere((guide) => guide.slug == 'cycle').localized('pt');

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue('');
    registerFallbackValue(
      GuideProgress(
        stepIndex: 0,
        answers: const [],
        savedAt: DateTime(2026, 11, 11),
        contentVersion: 'abc12345',
      ),
    );
  });

  setUp(() {
    repository = _MockGuidesRepository();
    when(() => repository.currentUserId).thenReturn('user-a');
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => money);
    when(() => repository.getProgress(any())).thenAnswer((_) async => null);
    when(() => repository.saveProgress(any(), any())).thenAnswer((_) async {});
    when(
      () => repository.savePrep(
        prepId: any(named: 'prepId'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenAnswer((_) async => 'prep-1');
  });

  Future<GuideCubit> startCubit({GuideSession? session}) async {
    final cubit = GuideCubit(repository: repository, session: session ?? GuideSession());
    await cubit.start('money');

    return cubit;
  }

  Future<void> pumpGuide(WidgetTester tester, GuideCubit cubit) async {
    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const GuidePage(slug: 'money'),
      ),
    );
    await tester.pump();
  }

  Future<void> goToLastStep(WidgetTester tester) async {
    for (var step = 0; step < money.stepCount - 1; step++) {
      await tester.tap(find.text('Próximo'));
      await tester.pump();
    }
  }

  testWidgets('the sensitive gate appears once per app session', (tester) async {
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => intimacy);
    final session = GuideSession();
    final first = GuideCubit(repository: repository, session: session);
    addTearDown(first.close);
    await tester.pumpApp(
      BlocProvider.value(
        value: first,
        child: const GuidePage(slug: 'intimacy'),
      ),
    );
    await tester.pump();
    await first.start('intimacy');
    await tester.pump();

    expect(find.text('Um tema sensível'), findsOneWidget);

    await tester.tap(find.text('Continuar'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Um tema sensível'), findsNothing);
    expect(first.state.showSensitiveGate, isFalse);

    final second = GuideCubit(repository: repository, session: session);
    addTearDown(second.close);
    await tester.pumpApp(
      BlocProvider.value(
        value: second,
        child: const GuidePage(slug: 'intimacy'),
      ),
    );
    await tester.pump();
    await second.start('intimacy');
    await tester.pump();

    expect(find.text('Um tema sensível'), findsNothing);
  });

  testWidgets('the cycle gate talks about body and mood, not intimacy', (tester) async {
    when(() => repository.getGuide(any(), languageCode: any(named: 'languageCode')))
        .thenAnswer((_) async => cycle);
    final cubit = GuideCubit(repository: repository, session: GuideSession());
    addTearDown(cubit.close);
    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const GuidePage(slug: 'cycle'),
      ),
    );
    await tester.pump();
    await cubit.start('cycle');
    await tester.pump();

    expect(find.textContaining('corpo e o humor ao longo do mês e foi pensado'), findsOneWidget);
    expect(find.textContaining('intimidade'), findsNothing);
  });

  testWidgets('a failed save keeps the answers on screen and shows the error', (tester) async {
    when(
      () => repository.savePrep(
        prepId: any(named: 'prepId'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = await startCubit();
    addTearDown(cubit.close);
    await pumpGuide(tester, cubit);

    await tester.enterText(find.byType(BaseTextArea), 'Uma nota importante');
    await tester.pump();
    await goToLastStep(tester);
    await tester.tap(find.text('Concluir'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Não deu para salvar agora. Suas respostas continuam aqui.'), findsOneWidget);
    expect(find.text('Concluir'), findsOneWidget);
    expect(cubit.state.isFinished, isFalse);

    for (var step = 0; step < money.stepCount - 1; step++) {
      await tester.tap(find.text('Voltar'));
      await tester.pump();
    }
    expect(find.text('Uma nota importante'), findsOneWidget);
  });

  testWidgets('the first finish inserts and a later finish updates the same row', (tester) async {
    GuideProgress? stored;
    when(() => repository.getProgress(any())).thenAnswer((_) async => stored);
    when(() => repository.saveProgress(any(), any())).thenAnswer((invocation) async {
      stored = invocation.positionalArguments[1] as GuideProgress;
    });
    final cubit = await startCubit();
    addTearDown(cubit.close);
    await pumpGuide(tester, cubit);

    await goToLastStep(tester);
    await tester.tap(find.text('Concluir'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Começar uma conversa'), findsOneWidget);
    expect(stored?.prepId, 'prep-1');

    await cubit.start('money');
    await tester.pump();
    await tester.tap(find.text('Concluir'));
    await tester.pump();
    await tester.pump();

    final prepIds = verify(
      () => repository.savePrep(
        prepId: captureAny(named: 'prepId'),
        guide: any(named: 'guide'),
        topic: any(named: 'topic'),
        notes: any(named: 'notes'),
        draft: any(named: 'draft'),
      ),
    ).captured;
    expect(prepIds, [null, 'prep-1']);
  });

  testWidgets('finishing opens the soft start builder', (tester) async {
    final cubit = await startCubit();
    AppInjector.instance.registerFactory<GuideCubit>(() => cubit);
    AppInjector.instance.registerFactory<SoftStartCubit>(SoftStartCubit.new);
    addTearDown(() {
      AppInjector.instance.unregister<GuideCubit>();
      AppInjector.instance.unregister<SoftStartCubit>();
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
    unawaited(router.push(GuideRoute(slug: 'money')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    await goToLastStep(tester);
    await tester.tap(find.text('Concluir'));
    await tester.pump();
    await tester.pump();

    await tester.tap(find.text('Começar uma conversa'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(SoftStartPage), findsOneWidget);
    expect(router.stack.last.name, SoftStartRoute.name);
  });
}
