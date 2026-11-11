import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';
import 'package:flutter_bloc_starter/features/spice/presentation/spice/cubit/spice_cubit.dart';
import 'package:flutter_bloc_starter/features/spice/presentation/spice/spice_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockSpiceRepository() extends Mock implements SpiceRepository;

class _TestRouter() extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NotFoundRoute.page, initial: true),
    AutoRoute(page: SpiceRoute.page, path: '/spice'),
  ];
}

void main() {
  late SpiceRepository repository;

  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  setUp(() {
    repository = _MockSpiceRepository();
    when(() => repository.isHidden).thenReturn(false);
    when(repository.getView).thenAnswer((_) async => const SpiceView(stage: SpiceStage.off));
    when(() => repository.setEnabled(enabled: any(named: 'enabled'))).thenAnswer((_) async {});
  });

  Future<SpiceCubit> loaded() async {
    final cubit = SpiceCubit(spiceRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  Future<void> pumpRouter(WidgetTester tester, RootStackRouter router) {
    return tester.pumpWidget(
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
  }

  void registerCubit() {
    AppInjector.instance.registerFactory<SpiceCubit>(() => SpiceCubit(spiceRepository: repository));
    addTearDown(() => AppInjector.instance.unregister<SpiceCubit>());
  }

  testWidgets('safe mode sends the page back instead of leaving the skeleton', (tester) async {
    when(() => repository.isHidden).thenReturn(true);
    registerCubit();
    final router = _TestRouter();
    await pumpRouter(tester, router);

    unawaited(router.push(const SpiceRoute()));
    await tester.pump();
    await tester.pump();

    expect(router.stack.map((route) => route.name), isNot(contains(SpiceRoute.name)));
    expect(find.byType(Skeletonizer), findsNothing);
  });

  testWidgets('a free person sees the Plus entry and no card', (tester) async {
    when(repository.getView).thenAnswer((_) async => const SpiceView(stage: SpiceStage.plusLocked));
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SpicePage()));
    await tester.pump();

    expect(find.text('Momentos a dois'), findsOneWidget);
    expect(find.text('PLUS'), findsOneWidget);
    expect(find.text('Disponível no Plus. Toque para ver os planos.'), findsOneWidget);
    expect(find.text('Tirar uma carta'), findsNothing);
  });

  testWidgets('a Plus person with both switched on sees a card', (tester) async {
    when(repository.getView).thenAnswer(
      (_) async => const SpiceView(
        stage: SpiceStage.ready,
        cards: ['Sussurre uma coisa de que você gosta.'],
      ),
    );
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SpicePage()));
    await tester.pump();

    expect(find.text('Sussurre uma coisa de que você gosta.'), findsOneWidget);
    expect(find.text('Tirar uma carta'), findsOneWidget);
    expect(find.text('PLUS'), findsNothing);
  });

  testWidgets('a partner switching off while the page is open returns to Today', (tester) async {
    var reads = 0;
    when(repository.getView).thenAnswer((_) async {
      reads++;

      return reads == 1
          ? const SpiceView(stage: SpiceStage.ready, cards: ['Uma carta'])
          : const SpiceView(stage: SpiceStage.waiting);
    });
    registerCubit();
    final router = _TestRouter();
    await pumpRouter(tester, router);

    unawaited(router.push(const SpiceRoute()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Uma carta'), findsOneWidget);

    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(reads, 2);
    expect(router.stack.map((route) => route.name), isNot(contains(SpiceRoute.name)));
  });

  testWidgets('a failed change shows a toast', (tester) async {
    when(() => repository.setEnabled(enabled: any(named: 'enabled')))
        .thenThrow(const LocalizedException(l10nKey: 'RATE_LIMITED'));
    final cubit = await loaded();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SpicePage()));
    await tester.pump();
    await tester.tap(find.text('Ligar'));
    await tester.pump();
    await tester.pump();

    expect(find.text('Muitas tentativas seguidas. Espere um instante.'), findsOneWidget);
  });

  testWidgets('opening the page makes no haptic or notification platform call', (tester) async {
    final cubit = await loaded();
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

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const SpicePage()));
    await tester.pump();

    expect(
      calls.where(
        (call) =>
            call.method == 'HapticFeedback.vibrate' ||
            call.method.toLowerCase().contains('notification'),
      ),
      isEmpty,
    );
  });
}
