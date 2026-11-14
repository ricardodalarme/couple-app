import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardsRepository() extends Mock implements CardsRepository;

void main() {
  late CardsRepository cards;

  final card = SundayCard(
    id: 'c1',
    status: 'sent',
    weekStart: DateTime(2026, 11, 9),
    items: const [CardItem(slipId: 's1', body: 'Uma coisa boa')],
  );
  final incoming = CardDetail(card: card, isMine: false, authorName: 'Rui', recipientName: 'Ana');
  final mine = CardDetail(card: card, isMine: true, authorName: 'Ana', recipientName: 'Rui');

  setUp(() {
    cards = _MockCardsRepository();
    when(() => cards.markRead(any())).thenAnswer((_) async {});
  });

  void stubDetail(CardDetail detail) =>
      when(() => cards.getDetail(id: 'c1')).thenAnswer((_) async => detail);

  void stubReaction({required String? result}) => when(
    () => cards.react(
      cardId: any(named: 'cardId'),
      reaction: any(named: 'reaction'),
      reply: any(named: 'reply'),
    ),
  ).thenAnswer((_) async => result);

  CardDetailCubit build() => CardDetailCubit(cardsRepository: cards);

  test('loading an incoming card marks it read once', () async {
    stubDetail(incoming);
    final cubit = build();

    await cubit.load('c1');
    await cubit.load('c1');

    verify(() => cards.markRead('c1')).called(1);
    expect((cubit.state.card as Success<CardDetail>).value, incoming);
  });

  test("the person's own card is never marked read", () async {
    stubDetail(mine);
    final cubit = build();

    await cubit.load('c1');

    verifyNever(() => cards.markRead(any()));
    expect(cubit.state.isMine, isTrue);
  });

  test('a reaction is saved and shown', () async {
    stubDetail(incoming);
    stubReaction(result: 'hug');
    final cubit = build();
    await cubit.load('c1');

    await cubit.toggleReaction(CardReaction.hug);

    expect(cubit.state.reaction, 'hug');
    expect(cubit.state.reactionAction, isA<Success<void>>());
    verify(
      () => cards.react(
        cardId: 'c1',
        reaction: 'hug',
        reply: any(named: 'reply'),
      ),
    ).called(1);
  });

  test('choosing another reaction changes it', () async {
    stubDetail(
      CardDetail(
        card: card,
        isMine: false,
        authorName: 'Rui',
        recipientName: 'Ana',
        reaction: 'hug',
      ),
    );
    stubReaction(result: 'thank_you');
    final cubit = build();
    await cubit.load('c1');

    await cubit.toggleReaction(CardReaction.thankYou);

    expect(cubit.state.reaction, 'thank_you');
    verify(
      () => cards.react(
        cardId: 'c1',
        reaction: 'thank_you',
        reply: any(named: 'reply'),
      ),
    ).called(1);
  });

  test('tapping the selected reaction keeps it and sends nothing', () async {
    stubDetail(
      CardDetail(
        card: card,
        isMine: false,
        authorName: 'Rui',
        recipientName: 'Ana',
        reaction: 'hug',
      ),
    );
    final cubit = build();
    await cubit.load('c1');

    await cubit.toggleReaction(CardReaction.hug);

    expect(cubit.state.reaction, 'hug');
    verifyNever(
      () => cards.react(
        cardId: any(named: 'cardId'),
        reaction: any(named: 'reaction'),
        reply: any(named: 'reply'),
      ),
    );
  });

  test('a failed reaction keeps the previous one and reports the failure', () async {
    stubDetail(
      CardDetail(
        card: card,
        isMine: false,
        authorName: 'Rui',
        recipientName: 'Ana',
        reaction: 'hug',
      ),
    );
    when(
      () => cards.react(
        cardId: any(named: 'cardId'),
        reaction: any(named: 'reaction'),
        reply: any(named: 'reply'),
      ),
    ).thenAnswer((_) async => throw Exception());
    final cubit = build();
    await cubit.load('c1');

    await cubit.toggleReaction(CardReaction.thankYou);

    expect(cubit.state.reaction, 'hug');
    expect(cubit.state.reactionAction, isA<Failure>());
  });

  test('the person cannot react to their own card', () async {
    stubDetail(mine);
    final cubit = build();
    await cubit.load('c1');

    await cubit.toggleReaction(CardReaction.hug);

    verifyNever(
      () => cards.react(
        cardId: any(named: 'cardId'),
        reaction: any(named: 'reaction'),
        reply: any(named: 'reply'),
      ),
    );
  });
}
