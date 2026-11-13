import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/cubit/memories_cubit.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/memories_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockMemoriesRepository() extends Mock implements MemoriesRepository;

class _MockTabsRouter() extends Mock implements TabsRouter;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  late MemoriesRepository repository;

  setUp(() {
    repository = _MockMemoriesRepository();
    when(() => repository.getMemories()).thenAnswer((_) async => []);
    when(() => repository.deleteMemory(any())).thenAnswer((_) async {});
    when(() => repository.drawFromJar()).thenAnswer((_) async => null);
    when(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
      ),
    ).thenAnswer((_) async {});
  });

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  Future<MemoriesCubit> build() async {
    final cubit = MemoriesCubit(memoriesRepository: repository);
    addTearDown(cubit.close);
    await cubit.load();

    return cubit;
  }

  Future<void> pumpPage(WidgetTester tester, MemoriesCubit cubit) async {
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const MemoriesPage()));
    await tester.pump();
  }

  testWidgets('adding a memory opens the form in a sheet and saves it', (tester) async {
    final cubit = await build();

    await pumpPage(tester, cubit);

    expect(find.byType(BaseEmptyState), findsOneWidget);
    expect(find.text('Adicionar memória'), findsOneWidget);

    await tester.tap(find.text('Adicionar memória'));
    await tester.pumpAndSettle();

    expect(find.text('Uma memória'), findsOneWidget);
    expect(find.text('Guardar memória'), findsOneWidget);

    await tester.enterText(find.byType(BaseTextField).first, 'Primeiro jantar');
    await tester.tap(find.text('Guardar memória'));
    await tester.pumpAndSettle();

    verify(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: 'Primeiro jantar',
        body: '',
        place: '',
        happenedOn: any(named: 'happenedOn'),
      ),
    ).called(1);
  });

  testWidgets('an empty title keeps the sheet open with the field error', (tester) async {
    final cubit = await build();

    await pumpPage(tester, cubit);
    await tester.tap(find.text('Adicionar memória'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Guardar memória'));
    await tester.pumpAndSettle();

    expect(find.text('Dê um título a esta memória'), findsOneWidget);
    expect(find.text('Guardar memória'), findsOneWidget);
    verifyNever(
      () => repository.addMemory(
        id: any(named: 'id'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
      ),
    );
  });

  testWidgets('tapping a memory shows its place and story', (tester) async {
    when(() => repository.getMemories()).thenAnswer(
      (_) async => [
        Memory(
          id: 'm1',
          title: 'Primeiro jantar',
          happenedOn: DateTime(2026, 5, 12),
          place: 'Paraty',
          body: 'Foi lindo',
        ),
      ],
    );
    final cubit = await build();

    await pumpPage(tester, cubit);
    await tester.tap(find.text('Primeiro jantar'));
    await tester.pumpAndSettle();

    expect(find.text('Lugar'), findsOneWidget);
    expect(find.text('Paraty'), findsOneWidget);
    expect(find.text('Como foi'), findsOneWidget);
    expect(find.text('Foi lindo'), findsOneWidget);
  });

  testWidgets('deleting a memory asks before removing it', (tester) async {
    when(() => repository.getMemories()).thenAnswer(
      (_) async => [Memory(id: 'm1', title: 'Primeiro jantar', happenedOn: DateTime(2026, 5, 12))],
    );
    final cubit = await build();

    await pumpPage(tester, cubit);
    await tester.tap(find.text('Apagar'));
    await tester.pumpAndSettle();

    expect(find.text('Apagar esta memória?'), findsOneWidget);
    verifyNever(() => repository.deleteMemory(any()));

    await tester.tap(
      find.descendant(of: find.byType(BaseConfirmSheet), matching: find.text('Apagar')),
    );
    await tester.pumpAndSettle();

    verify(() => repository.deleteMemory('m1')).called(1);
  });

  testWidgets('the empty jar opens the slips tab instead of the timeline', (tester) async {
    final cubit = await build();
    await cubit.onViewChanged(MemoriesView.jar);

    final tabs = _MockTabsRouter();
    when(() => tabs.routeCollection).thenReturn(
      RouteCollection.fromList([
        AutoRoute(page: TodayRoute.page),
        AutoRoute(page: SlipsRoute.page),
      ]),
    );
    when(() => tabs.setActiveIndex(any())).thenAnswer((_) {});

    await tester.pumpApp(
      TabsRouterScope(
        controller: tabs,
        stateHash: 0,
        child: BlocProvider.value(value: cubit, child: const MemoriesPage()),
      ),
    );
    await tester.pump();

    expect(find.text('O potinho está vazio'), findsOneWidget);
    await tester.tap(find.text('Ver meus slips'));
    await tester.pump();

    verify(() => tabs.setActiveIndex(1)).called(1);
    expect(cubit.state.view, MemoriesView.timeline);
  });
}
