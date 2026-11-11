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
  });

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

  testWidgets('the save footer waits for a dirty form', (tester) async {
    final cubit = await build();

    await pumpPage(tester, cubit);

    expect(find.byType(BaseEmptyState), findsOneWidget);
    expect(find.byType(BaseButton), findsNothing);
    expect(find.text('Adicionar memória'), findsOneWidget);
    expect(find.text('Uma memória'), findsNothing);

    cubit.onTitleChanged('Primeiro jantar');
    await tester.pump();
    await tester.pump();

    expect(find.byType(BaseButton), findsOneWidget);
    expect(tester.widget<BaseButton>(find.byType(BaseButton)).isEnabled, isTrue);

    cubit.onTitleChanged('');
    await tester.pump();
    await tester.pump();

    expect(find.byType(BaseButton), findsNothing);
  });
}
