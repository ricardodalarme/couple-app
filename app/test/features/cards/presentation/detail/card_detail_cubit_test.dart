import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardsRepository() extends Mock implements CardsRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late CardsRepository cards;
  late ProfileRepository profile;

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
    profile = _MockProfileRepository();
    when(() => profile.getMyProfile())
        .thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials'));
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose));
    when(() => cards.markRead(any())).thenAnswer((_) async {});
  });

  void stubDetail(CardDetail detail) =>
      when(() => cards.getDetail(id: 'c1', selfId: 'me')).thenAnswer((_) async => detail);

  void stubReceipts({required bool shares}) =>
      when(() => profile.getMySettings())
          .thenAnswer((_) async => AccountSettings(theme: .rose, shareReadReceipts: shares));

  void stubReaction({required String? result}) => when(
    () => cards.react(
      cardId: any(named: 'cardId'),
      reaction: any(named: 'reaction'),
    ),
  ).thenAnswer((_) async => result);

  CardDetailCubit build() => CardDetailCubit(cardsRepository: cards, profileRepository: profile);

  test('loading an incoming card marks it read once when receipts are shared', () async {
    stubDetail(incoming);
    stubReceipts(shares: true);
    final cubit = build();

    await cubit.load('c1');
    await cubit.load('c1');

    verify(() => cards.markRead('c1')).called(1);
    expect((cubit.state.card as Success<CardDetail>).value, incoming);
  });

  test('loading an incoming card leaves it unread when receipts are off', () async {
    stubDetail(incoming);
    stubReceipts(shares: false);
    final cubit = build();

    await cubit.load('c1');

    verifyNever(() => cards.markRead(any()));
    expect(cubit.state.card, isA<Success<CardDetail>>());
  });

  test("the person's own card is never marked read", () async {
    stubDetail(mine);
    stubReceipts(shares: true);
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
    verify(() => cards.react(cardId: 'c1', reaction: 'hug')).called(1);
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
    verify(() => cards.react(cardId: 'c1', reaction: 'thank_you')).called(1);
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
    verifyNever(() => cards.react(cardId: any(named: 'cardId'), reaction: any(named: 'reaction')));
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
      ),
    );
  });
}
