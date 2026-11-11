import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/history_page.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

void main() {
  late HistoryRepository repository;

  setUp(() {
    repository = _MockHistoryRepository();
  });

  testWidgets('renders warm empty state with suggested first milestone when timeline is empty', (
    tester,
  ) async {
    final emptyOverview = HistoryOverview(
      selfId: 's1',
      selfName: 'Rafa',
      selfInitials: 'R',
      partnerName: 'Marina',
      partnerInitials: 'M',
      isPaired: true,
      coupleId: 'c1',
      avatarKind: AvatarKind.initials,
      phase: RelationshipPhase.beginning,
      milestones: const [],
      storyDates: StoryDatesSummary.empty(),
      numbers: HistoryNumbers.compute(
        togetherSince: null,
        now: DateTime(2026, 11, 8),
        places: const [],
      ),
    );
    when(() => repository.getOverview()).thenAnswer((_) async => emptyOverview);

    final cubit = HistoryCubit(historyRepository: repository);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HistoryPage()));
    await tester.pumpAndSettle();

    expect(find.text('Começando'), findsOneWidget);
    expect(find.text('Comece pelo primeiro marco'), findsOneWidget);
    expect(find.text('Nos conhecemos'), findsOneWidget);
    expect(find.text('Adicionar um marco'), findsOneWidget);
  });

  testWidgets('paginates timeline by year and reveals earlier years on tap', (tester) async {
    final milestones = [
      HistoryMilestone(
        id: 'm2026',
        source: MilestoneSource.memory,
        kind: MilestoneKind.trip,
        title: 'Viagem 2026',
        date: DateTime(2026, 5, 10),
        place: 'Paraty',
      ),
      HistoryMilestone(
        id: 'm2025',
        source: MilestoneSource.memory,
        kind: MilestoneKind.first,
        title: 'Momento 2025',
        date: DateTime(2025, 4, 10),
      ),
      HistoryMilestone(
        id: 'm2024',
        source: MilestoneSource.storyEvent,
        kind: MilestoneKind.met,
        title: 'Início 2024',
        date: DateTime(2024, 3, 14),
      ),
    ];

    final overview = HistoryOverview(
      selfId: 's1',
      selfName: 'Rafa',
      selfInitials: 'R',
      partnerName: 'Marina',
      partnerInitials: 'M',
      isPaired: true,
      coupleId: 'c1',
      avatarKind: AvatarKind.initials,
      phase: RelationshipPhase.dating,
      togetherSince: DateTime(2024, 3, 14),
      milestones: milestones,
      storyDates: StoryDatesSummary.empty(),
      numbers: HistoryNumbers.compute(
        togetherSince: DateTime(2024, 3, 14),
        now: DateTime(2026, 11, 8),
        places: const ['Paraty'],
      ),
    );
    when(() => repository.getOverview()).thenAnswer((_) async => overview);

    final cubit = HistoryCubit(historyRepository: repository);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HistoryPage()));
    await tester.pumpAndSettle();

    expect(find.text('Viagem 2026'), findsOneWidget);
    expect(find.text('Momento 2025'), findsOneWidget);
    expect(find.text('Início 2024'), findsNothing);
    expect(find.text('Ver 2024'), findsOneWidget);

    cubit.showMoreYears();
    await tester.pumpAndSettle();

    expect(find.text('Início 2024'), findsOneWidget);
  });
}
