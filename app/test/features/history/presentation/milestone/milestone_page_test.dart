import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/cubit/milestone_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/milestone_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  late HistoryRepository repository;

  setUp(() {
    repository = _MockHistoryRepository();
    when(() => repository.getOverview()).thenAnswer((_) async => HistoryOverview.fake());
  });

  testWidgets('renders milestone detail and supports unknown date selection', (tester) async {
    final existing = HistoryMilestone.fake();
    final cubit = MilestoneCubit(historyRepository: repository);
    await cubit.initialize(initialMilestone: existing);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: MilestonePage(initialMilestone: existing),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Primeira viagem juntos'), findsWidgets);
    expect(find.text('Os dois'), findsOneWidget);
    expect(find.text('Apagar'), findsOneWidget);
    expect(find.text('Salvar'), findsOneWidget);

    cubit.onPrecisionSelected(MilestoneDatePrecision.unknown);
    await tester.pumpAndSettle();

    expect(find.text('Data desconhecida'), findsWidgets);
  });

  testWidgets('renders a partner-owned milestone read-only', (tester) async {
    const partnerMilestone = HistoryMilestone(
      id: 'partner-1',
      source: MilestoneSource.memory,
      kind: MilestoneKind.trip,
      title: 'Viagem da Marina',
      isMine: false,
      authorName: 'Marina',
    );
    final cubit = MilestoneCubit(historyRepository: repository);
    await cubit.initialize(initialMilestone: partnerMilestone);

    await tester.pumpApp(
      BlocProvider.value(
        value: cubit,
        child: const MilestonePage(initialMilestone: partnerMilestone),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Viagem da Marina'), findsOneWidget);
    expect(find.text('Adicionado por Marina. Só quem criou pode editar.'), findsOneWidget);
    expect(find.text('Apagar'), findsNothing);
    expect(find.text('Salvar'), findsNothing);

    await cubit.delete();
    expect(find.text('Apagar'), findsNothing);
  });
}
