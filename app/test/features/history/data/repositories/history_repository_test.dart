import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/history_data_source.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/queries/generated/HistoryOverview.graphql.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHistoryDataSource() extends Mock implements HistoryDataSource;

void main() {
  late HistoryDataSource dataSource;
  late HistoryRepository repository;

  setUpAll(() {
    registerFallbackValue(DateTime(2026));
    registerFallbackValue(EnumRelationshipPhase.dating);
  });

  setUp(() {
    dataSource = _MockHistoryDataSource();
    repository = HistoryRepository(dataSource: dataSource);
  });

  test('getOverview maps story events, memories, unknown-year dates, and year recap', () async {
    when(() => dataSource.getOverview(year: any(named: 'year'))).thenAnswer(
      (_) async => QueryHistoryOverview(
        myProfile: QueryHistoryOverviewmyProfile(
          id: 'self-1',
          displayName: 'Rafa',
          avatarKind: EnumAvatarKind.initials,
        ),
        myPartner: QueryHistoryOverviewmyPartner(
          id: 'partner-1',
          displayName: 'Marina',
          avatarKind: EnumAvatarKind.photo,
        ),
        mySettings: QueryHistoryOverviewmySettings(
          profileId: 'self-1',
          phase: EnumRelationshipPhase.dating,
          togetherSince: DateTime(2024, 3, 14),
          partnerName: 'Marina',
          relationshipStatus: EnumRelationshipStatus.together,
        ),
        myCouple: QueryHistoryOverviewmyCouple(id: 'couple-1'),
        storyEventsCollection: QueryHistoryOverviewstoryEventsCollection(
          edges: [
            QueryHistoryOverviewstoryEventsCollectionedges(
              node: QueryHistoryOverviewstoryEventsCollectionedgesnode(
                id: 'se-1',
                isMine: true,
                isShared: true,
                kind: EnumStoryEventKind.met,
                title: 'Nos conhecemos',
                happenedOn: DateTime(2024, 3, 14),
                datePrecision: EnumDatePrecision.day,
              ),
            ),
            QueryHistoryOverviewstoryEventsCollectionedges(
              node: QueryHistoryOverviewstoryEventsCollectionedgesnode(
                id: 'se-2',
                isMine: false,
                isShared: true,
                kind: EnumStoryEventKind.dating,
                title: 'Começamos a namorar',
                happenedOn: DateTime(2024, 3, 22),
                datePrecision: EnumDatePrecision.day,
              ),
            ),
          ],
          pageInfo: QueryHistoryOverviewstoryEventsCollectionpageInfo(hasNextPage: false),
        ),
        memoriesCollection: QueryHistoryOverviewmemoriesCollection(
          edges: [
            QueryHistoryOverviewmemoriesCollectionedges(
              node: QueryHistoryOverviewmemoriesCollectionedgesnode(
                id: 'mem-1',
                isMine: true,
                isShared: true,
                title: 'Primeira viagem juntos',
                happenedOn: DateTime(2025, 7, 1),
                datePrecision: EnumDatePrecision.month,
                place: 'Paraty',
                origin: EnumMemoryOrigin.manual,
              ),
            ),
          ],
          pageInfo: QueryHistoryOverviewmemoriesCollectionpageInfo(hasNextPage: false),
        ),
        importantDatesCollection: QueryHistoryOverviewimportantDatesCollection(
          edges: [
            QueryHistoryOverviewimportantDatesCollectionedges(
              node: QueryHistoryOverviewimportantDatesCollectionedgesnode(
                id: 'id-1',
                isMine: true,
                isShared: true,
                title: 'Primeiro olhar',
                kind: EnumImportantDateKind.first,
                month: 1,
                day: 1,
                year: null,
                yearly: false,
                hidden: false,
              ),
            ),
          ],
          pageInfo: QueryHistoryOverviewimportantDatesCollectionpageInfo(hasNextPage: false),
        ),
        myYear: QueryHistoryOverviewmyYear(
          year: 2026,
          memories: 4,
          firsts: 2,
          slips: 10,
          cardsSent: 3,
          cardsReceived: 3,
          ritualsDone: 5,
        ),
      ),
    );

    final overview = await repository.getOverview(now: DateTime(2026, 11, 8));

    expect(overview.selfInitials, 'R');
    expect(overview.partnerInitials, 'M');
    expect(overview.milestones, hasLength(4));
    expect(overview.hasUnknownYearMilestones, isTrue);
    expect(overview.numbers.places, ['Paraty']);
    expect(overview.storyDates.hasDifferentStartDates, isTrue);
    expect(overview.storyDates.met.isMine, isTrue);
    expect(overview.storyDates.dating.isMine, isFalse);
    expect(overview.storyDates.dating.authorName, 'Marina');
    expect(overview.relationshipStatus, RelationshipStatus.together);
    expect(overview.memoryCount, 1);
    expect(overview.hasMoreHistory, isFalse);
  });

  test('refuses to edit or delete a partner-owned milestone', () async {
    const partnerMilestone = HistoryMilestone(
      id: 'partner-memory',
      source: MilestoneSource.memory,
      kind: MilestoneKind.trip,
      title: 'Viagem dela',
      isMine: false,
    );

    await expectLater(
      repository.deleteMilestone(partnerMilestone),
      throwsA(isA<LocalizedException>()),
    );
    await expectLater(
      repository.saveMilestone(
        id: 'partner-memory',
        title: 'Viagem dela',
        kind: MilestoneKind.trip,
        precision: MilestoneDatePrecision.day,
        isShared: true,
        date: DateTime(2025, 7, 15),
        existing: partnerMilestone,
      ),
      throwsA(isA<LocalizedException>()),
    );
    await expectLater(
      repository.saveStoryDate(
        id: 'new-event',
        profileId: 'self-1',
        kind: StoryEventKind.dating,
        title: 'Começamos a namorar',
        date: DateTime(2024, 3, 22),
        existingEventId: 'partner-event',
        existingEventIsMine: false,
      ),
      throwsA(isA<LocalizedException>()),
    );

    verifyNever(() => dataSource.deleteMemory(any()));
    verifyNever(
      () => dataSource.updateStoryEvent(
        id: any(named: 'id'),
        kind: any(named: 'kind'),
        happenedOn: any(named: 'happenedOn'),
        datePrecision: any(named: 'datePrecision'),
        title: any(named: 'title'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('updates a memory with the kind origin round-trip', () async {
    when(
      () => dataSource.updateMemory(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
        datePrecision: any(named: 'datePrecision'),
        origin: any(named: 'origin'),
      ),
    ).thenAnswer((_) async {});

    const existing = HistoryMilestone(
      id: 'mem-1',
      source: MilestoneSource.memory,
      kind: MilestoneKind.custom,
      title: 'Primeira vez',
      isMine: true,
    );

    await repository.saveMilestone(
      id: 'mem-1',
      title: 'Primeira vez',
      kind: MilestoneKind.first,
      precision: MilestoneDatePrecision.month,
      isShared: true,
      date: DateTime(2025, 7, 15),
      body: 'Guardado',
      coupleId: 'couple-1',
      existing: existing,
    );

    verify(
      () => dataSource.updateMemory(
        id: 'mem-1',
        coupleId: 'couple-1',
        title: 'Primeira vez',
        body: 'Guardado',
        place: null,
        happenedOn: DateTime.utc(2025, 7, 1),
        datePrecision: EnumDatePrecision.month,
        origin: EnumMemoryOrigin.first,
      ),
    ).called(1);
  });

  test('converts a story event into a memory before deleting the old row', () async {
    when(
      () => dataSource.insertMemory(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
        datePrecision: any(named: 'datePrecision'),
        origin: any(named: 'origin'),
      ),
    ).thenAnswer((_) async {});
    when(() => dataSource.deleteStoryEvent(any())).thenAnswer((_) async {});

    const existing = HistoryMilestone(
      id: 'se-1',
      source: MilestoneSource.storyEvent,
      kind: MilestoneKind.met,
      title: 'Nos conhecemos',
      isMine: true,
    );

    await repository.saveMilestone(
      id: 'se-1',
      title: 'Nos conhecemos em Paraty',
      kind: MilestoneKind.trip,
      precision: MilestoneDatePrecision.month,
      isShared: true,
      date: DateTime(2024, 3, 14),
      place: 'Paraty',
      coupleId: 'couple-1',
      existing: existing,
    );

    verifyInOrder([
      () => dataSource.insertMemory(
        id: 'se-1',
        coupleId: 'couple-1',
        title: 'Nos conhecemos em Paraty',
        body: null,
        place: 'Paraty',
        happenedOn: DateTime.utc(2024, 3, 1),
        datePrecision: EnumDatePrecision.month,
        origin: EnumMemoryOrigin.manual,
      ),
      () => dataSource.deleteStoryEvent('se-1'),
    ]);
  });

  test('saveMilestone stores unknown-date milestones in important_dates with year null', () async {
    when(
      () => dataSource.insertImportantDate(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        month: any(named: 'month'),
        day: any(named: 'day'),
        year: any(named: 'year'),
        yearly: any(named: 'yearly'),
      ),
    ).thenAnswer((_) async {});

    await repository.saveMilestone(
      id: 'ms-unknown',
      title: 'Primeira música',
      kind: MilestoneKind.first,
      precision: MilestoneDatePrecision.unknown,
      isShared: true,
      coupleId: 'couple-1',
    );

    verify(
      () => dataSource.insertImportantDate(
        id: 'ms-unknown',
        coupleId: 'couple-1',
        title: 'Primeira música',
        kind: EnumImportantDateKind.first,
        month: 1,
        day: 1,
        year: null,
        yearly: false,
      ),
    ).called(1);
  });

  test('saveMilestone stores milestones with place in memoriesCollection', () async {
    when(
      () => dataSource.insertMemory(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        place: any(named: 'place'),
        happenedOn: any(named: 'happenedOn'),
        datePrecision: any(named: 'datePrecision'),
        origin: any(named: 'origin'),
      ),
    ).thenAnswer((_) async {});

    await repository.saveMilestone(
      id: 'ms-trip',
      title: 'Viagem para Paraty',
      kind: MilestoneKind.trip,
      precision: MilestoneDatePrecision.month,
      date: DateTime(2025, 7, 15),
      place: 'Paraty',
      isShared: false,
      coupleId: 'couple-1',
    );

    verify(
      () => dataSource.insertMemory(
        id: 'ms-trip',
        coupleId: null,
        title: 'Viagem para Paraty',
        body: null,
        place: 'Paraty',
        happenedOn: DateTime.utc(2025, 7, 1),
        datePrecision: EnumDatePrecision.month,
        origin: EnumMemoryOrigin.manual,
      ),
    ).called(1);
  });

  test('updateAvatarKind and updatePhase forward to data source', () async {
    when(
      () => dataSource.updateAvatarKind(
        profileId: any(named: 'profileId'),
        avatarKind: any(named: 'avatarKind'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => dataSource.updatePhase(
        profileId: any(named: 'profileId'),
        phase: any(named: 'phase'),
      ),
    ).thenAnswer((_) async {});

    await repository.updateAvatarKind(profileId: 'p1', kind: AvatarKind.illustration);
    await repository.updatePhase(profileId: 'p1', phase: RelationshipPhase.engaged);

    verify(
      () => dataSource.updateAvatarKind(profileId: 'p1', avatarKind: EnumAvatarKind.illustration),
    ).called(1);
    verify(() => dataSource.updatePhase(profileId: 'p1', phase: EnumRelationshipPhase.engaged))
        .called(1);
  });
}
