import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/data/models/story_event_kind.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockHistoryRepository() extends Mock implements HistoryRepository;

HistoryOverview _overviewWithoutTogetherSince() {
  final base = HistoryOverview.fake();

  return HistoryOverview(
    selfId: base.selfId,
    selfName: base.selfName,
    selfInitials: base.selfInitials,
    isPaired: base.isPaired,
    avatarKind: base.avatarKind,
    phase: base.phase,
    milestones: base.milestones,
    storyDates: base.storyDates,
    numbers: base.numbers,
    coupleId: base.coupleId,
  );
}

void main() {
  late HistoryRepository repository;

  setUpAll(() => registerFallbackValue(DateTime(2026)));

  setUp(() {
    repository = _MockHistoryRepository();
    when(() => repository.getOverview()).thenAnswer((_) async => HistoryOverview.fake());
    when(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    ).thenAnswer((_) async {});
  });

  StoryDatesCubit build() {
    final cubit = StoryDatesCubit(historyRepository: repository);
    addTearDown(cubit.close);

    return cubit;
  }

  test('saving a picked date writes its kind, title and date', () async {
    final cubit = build();
    await cubit.load();

    await cubit.saveDate(
      kind: StoryEventKind.engaged,
      title: 'Noivamos',
      date: DateTime(2025, 6, 7),
    );

    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: 'fake-self',
        kind: StoryEventKind.engaged,
        title: 'Noivamos',
        date: DateTime(2025, 6, 7),
        existingEventId: null,
        existingEventIsMine: true,
        coupleId: 'fake-couple',
        updateTogetherSince: false,
      ),
    ).called(1);
    verify(() => repository.getOverview()).called(2);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('dating updates the together-since date and a later met does not', () async {
    final cubit = build();
    await cubit.load();

    await cubit.saveDate(
      kind: StoryEventKind.dating,
      title: 'Começamos a namorar',
      date: DateTime(2024, 3, 14),
    );
    await cubit.saveDate(
      kind: StoryEventKind.met,
      title: 'Nos conhecemos',
      date: DateTime(2023, 2, 1),
    );

    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: StoryEventKind.dating,
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: true,
      ),
    ).called(1);
    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: StoryEventKind.met,
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: false,
      ),
    ).called(1);
  });

  test('met updates the together-since date when there is none', () async {
    when(() => repository.getOverview()).thenAnswer((_) async => _overviewWithoutTogetherSince());
    final cubit = build();
    await cubit.load();

    await cubit.saveDate(
      kind: StoryEventKind.met,
      title: 'Nos conhecemos',
      date: DateTime(2023, 2, 1),
    );

    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: StoryEventKind.met,
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: true,
      ),
    ).called(1);
  });

  test('a failed save surfaces the failure and returns to initial', () async {
    when(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();
    final actions = <Resource<void>>[];
    final subscription = cubit.stream.listen((state) => actions.add(state.saveAction));
    addTearDown(subscription.cancel);

    await cubit.saveDate(
      kind: StoryEventKind.met,
      title: 'Nos conhecemos',
      date: DateTime(2023, 2, 1),
    );
    await pumpEventQueue();

    final failure = actions.whereType<Failure>().single;
    expect(
      failure.exception,
      isA<LocalizedException>().having((exception) => exception.l10nKey, 'l10nKey', 'NETWORK'),
    );
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('a second tap while a save is in flight does nothing', () async {
    final pending = Completer<void>();
    when(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    ).thenAnswer((_) => pending.future);
    final cubit = build();
    await cubit.load();

    final first = cubit.saveDate(
      kind: StoryEventKind.met,
      title: 'Nos conhecemos',
      date: DateTime(2023, 2, 1),
    );
    await pumpEventQueue();
    expect(cubit.state.saveAction, isA<Loading>());

    await cubit.saveDate(
      kind: StoryEventKind.met,
      title: 'Nos conhecemos',
      date: DateTime(2023, 2, 2),
    );

    verify(
      () => repository.saveStoryDate(
        id: any(named: 'id'),
        profileId: any(named: 'profileId'),
        kind: any(named: 'kind'),
        title: any(named: 'title'),
        date: any(named: 'date'),
        existingEventId: any(named: 'existingEventId'),
        existingEventIsMine: any(named: 'existingEventIsMine'),
        coupleId: any(named: 'coupleId'),
        updateTogetherSince: any(named: 'updateTogetherSince'),
      ),
    ).called(1);

    pending.complete();
    await first;
  });
}
