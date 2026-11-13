import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/cubit/memories_cubit.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/memories_page.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockMemoriesRepository() extends Mock implements MemoriesRepository;

void main() {
  setUpAll(() => LocaleSettings.setLocaleSync(AppLocale.pt));

  late MemoriesRepository repository;

  setUp(() {
    repository = _MockMemoriesRepository();
    when(() => repository.getMemories()).thenAnswer((_) async => []);
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
}
