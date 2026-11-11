import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/variations/counter_variations_page.dart';
import 'package:flutter_bloc_starter/features/history/presentation/variations/cubit/counter_variations_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  setUpAll(() => registerFallbackValue(RelationshipPhase.dating));

  testWidgets('renders the 5 relationship-kind counter variants (X-143)', (tester) async {
    final repository = _MockHistoryRepository();
    when(repository.getOverview).thenAnswer((_) async => HistoryOverview.fake());
    when(
      () => repository.updatePhase(
        profileId: any(named: 'profileId'),
        phase: any(named: 'phase'),
      ),
    ).thenAnswer((_) async {});

    final cubit = CounterVariationsCubit(historyRepository: repository);
    await cubit.load();

    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CounterVariationsPage()));
    await tester.pumpAndSettle();

    expect(find.text('Como o contador aparece'), findsOneWidget);
    expect(find.text('2 anos, 7 meses e 25 dias'), findsOneWidget);
    expect(find.text('Namoro'), findsOneWidget);
    expect(find.text('Noivado'), findsOneWidget);
    expect(find.text('Casados'), findsOneWidget);
    expect(find.text('Começando'), findsOneWidget);
    expect(find.text('Distância'), findsOneWidget);
    expect(find.text('Faltam 42 dias'), findsNothing);
  });
}
