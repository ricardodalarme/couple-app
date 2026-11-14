import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/history_page.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
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

  testWidgets('the chip row spans the page and keeps the page inset while scrolling', (
    tester,
  ) async {
    const surfaceWidth = 390.0;
    await tester.binding.setSurfaceSize(const Size(surfaceWidth, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final columnWidth = math.min(
      surfaceWidth - 2 * AppSpace.screenMargin,
      AppSpace.maxContentWidth,
    );
    final columnInset = (surfaceWidth - columnWidth) / 2;

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
      milestones: const [],
      storyDates: StoryDatesSummary.empty(),
      numbers: HistoryNumbers.compute(
        togetherSince: DateTime(2024, 3, 14),
        now: DateTime(2026, 11, 8),
        places: const [],
      ),
    );
    when(() => repository.getOverview()).thenAnswer((_) async => overview);

    final cubit = HistoryCubit(historyRepository: repository);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const HistoryPage()));
    await tester.pumpAndSettle();

    final scroller = find.byWidgetPredicate(
      (widget) => widget is SingleChildScrollView && widget.scrollDirection == Axis.horizontal,
    );
    expect(scroller, findsOneWidget);

    final l10n = tester.element(find.byType(HistoryPage)).l10n.history;
    final firstChip = find.widgetWithText(BaseChoiceChip, l10n.storyDatesAction);
    final lastChip = find.widgetWithText(BaseChoiceChip, l10n.avatarAction);

    final scrollerRect = tester.getRect(scroller);
    expect(scrollerRect.left, moreOrLessEquals(0, epsilon: .001));
    expect(scrollerRect.right, moreOrLessEquals(surfaceWidth, epsilon: .001));
    expect(tester.getRect(firstChip).left, moreOrLessEquals(columnInset, epsilon: .001));

    final position = tester
        .state<ScrollableState>(find.descendant(of: scroller, matching: find.byType(Scrollable)))
        .position;
    expect(position.maxScrollExtent, greaterThan(0));

    position.jumpTo(position.maxScrollExtent);
    await tester.pump();

    expect(
      tester.getRect(lastChip).right,
      moreOrLessEquals(surfaceWidth - columnInset, epsilon: .001),
    );
  });
}
