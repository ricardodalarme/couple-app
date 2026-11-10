import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/list/cubit/cards_list_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardsRepository() extends Mock implements CardsRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

CardSummary _card(String id, {bool mine = true}) =>
    CardSummary(id: id, isMine: mine, sentAt: DateTime(2026, 11, 2), itemCount: 3);

void main() {
  late CardsRepository cards;
  late ProfileRepository profile;

  setUp(() {
    cards = _MockCardsRepository();
    profile = _MockProfileRepository();
    when(() => profile.getMyProfile())
        .thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials'));
  });

  CardsListCubit build() => CardsListCubit(cardsRepository: cards, profileRepository: profile);

  void stub(CardSummaryPage page, {String? after}) =>
      when(() => cards.getHistory(selfId: 'me', after: after)).thenAnswer((_) async => page);

  test('load shows sent and received cards in the order the server gave', () async {
    stub(CardSummaryPage(items: [_card('a'), _card('b', mine: false)], hasNext: false));
    final cubit = build();

    await cubit.load();

    final items = (cubit.state.cards as Success<List<CardSummary>>).value;
    expect(items.map((card) => card.id), ['a', 'b']);
    expect(items.last.isMine, isFalse);
  });

  test('an empty history is a success, never an error', () async {
    stub(const CardSummaryPage(items: [], hasNext: false));
    final cubit = build();

    await cubit.load();

    expect((cubit.state.cards as Success<List<CardSummary>>).value, isEmpty);
  });

  test('loadMore appends the next page without duplicates', () async {
    stub(CardSummaryPage(items: [_card('a')], hasNext: true, cursor: 'c1'));
    final cubit = build();
    await cubit.load();

    stub(CardSummaryPage(items: [_card('a'), _card('b')], hasNext: false), after: 'c1');
    await cubit.loadMore();

    expect((cubit.state.cards as Success<List<CardSummary>>).value.map((card) => card.id), [
      'a',
      'b',
    ]);
  });

  test('a failed first load shows a failure', () async {
    when(
      () => cards.getHistory(
        selfId: any(named: 'selfId'),
        after: any(named: 'after'),
      ),
    ).thenAnswer((_) async => throw Exception());
    final cubit = build();

    await cubit.load();

    expect(cubit.state.cards, isA<Failure>());
  });

  test('a failed refresh keeps the list on screen', () async {
    stub(CardSummaryPage(items: [_card('a')], hasNext: false));
    final cubit = build();
    await cubit.load();

    when(
      () => cards.getHistory(
        selfId: any(named: 'selfId'),
        after: any(named: 'after'),
      ),
    ).thenAnswer((_) async => throw Exception());
    await cubit.load();

    expect(cubit.state.cards, isA<Success<List<CardSummary>>>());
  });

  test('a refresh discards a page that was already in flight', () async {
    stub(CardSummaryPage(items: [_card('a')], hasNext: true, cursor: 'c1'));
    final cubit = build();
    await cubit.load();

    final page = Completer<CardSummaryPage>();
    when(() => cards.getHistory(selfId: 'me', after: 'c1')).thenAnswer((_) => page.future);
    final more = cubit.loadMore();

    stub(CardSummaryPage(items: [_card('fresh')], hasNext: false));
    await cubit.load();

    page.complete(CardSummaryPage(items: [_card('stale')], hasNext: false));
    await more;

    final items = (cubit.state.cards as Success<List<CardSummary>>).value;
    expect(items.map((card) => card.id), ['fresh']);
    expect(cubit.state.isLoadingMore, isFalse);
  });
}
