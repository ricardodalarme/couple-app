import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockCardsRepository() extends Mock implements CardsRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockPairingRepository() extends Mock implements PairingRepository;

void main() {
  late CardsRepository cards;
  late ProfileRepository profile;
  late PairingRepository pairing;

  final card = SundayCard(
    id: 'c1',
    status: 'draft',
    weekStart: DateTime(2026, 11, 9),
    items: const [
      CardItem(slipId: 'a', body: 'Um'),
      CardItem(slipId: 'b', body: 'Dois'),
      CardItem(slipId: 'c', body: 'Três'),
    ],
  );

  setUpAll(() => registerFallbackValue(card));

  setUp(() {
    cards = _MockCardsRepository();
    profile = _MockProfileRepository();
    pairing = _MockPairingRepository();
    when(
      () => pairing.getPartner(),
    ).thenAnswer((_) async => const Profile(id: 'p', avatarKind: 'initials', displayName: 'Rui'));
    when(() => cards.getDraft()).thenAnswer((_) async => card);
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose, partnerName: 'Rui'));
  });

  SundayCardCubit build() => SundayCardCubit(
    cardsRepository: cards,
    profileRepository: profile,
    pairingRepository: pairing,
  );

  Future<SundayCardCubit> loaded() async {
    final cubit = build();
    await cubit.load();
    return cubit;
  }

  test('load shows the draft with both names', () async {
    final cubit = await loaded();

    expect(cubit.state.card, Success(card));
    expect(cubit.state.selfName, 'Ana');
    expect(cubit.state.partnerName, 'Rui');
  });

  test('a failed first load shows a failure', () async {
    when(() => cards.getDraft()).thenAnswer((_) async => throw Exception());
    final cubit = build();
    await cubit.load();

    expect(cubit.state.card, isA<Failure>());
  });

  test('editing works on a copy and cancelling drops it', () async {
    final cubit = await loaded()
      ..startEditing()
      ..removeItem(0);

    expect(cubit.state.draft!.items.map((item) => item.slipId), ['b', 'c']);
    expect((cubit.state.card as Success<SundayCard>).value.items, hasLength(3));

    cubit.cancelEditing();
    expect(cubit.state.isEditing, isFalse);
  });

  test('a sent card cannot be edited', () async {
    when(() => cards.getDraft()).thenAnswer(
      (_) async =>
          SundayCard(id: 'c1', status: 'sent', weekStart: DateTime(2026, 11, 9), items: const []),
    );
    final cubit = await loaded()
      ..startEditing();

    expect(cubit.state.isEditing, isFalse);
  });

  test('items move one place and stay inside the list', () async {
    final cubit = await loaded()
      ..startEditing()
      ..moveItem(0, -1)
      ..moveItem(0, 1);

    expect(cubit.state.draft!.items.map((item) => item.slipId), ['b', 'a', 'c']);

    cubit.moveItem(2, 1);
    expect(cubit.state.draft!.items.map((item) => item.slipId), ['b', 'a', 'c']);
  });

  test('the closing note is capped', () async {
    final cubit = await loaded()
      ..startEditing()
      ..onNoteChanged('a' * (cardNoteMaxLength + 20));

    expect(cubit.state.draft!.note!.length, cardNoteMaxLength);
  });

  test('save sends the edited card and leaves edit mode', () async {
    final saved = card.copyWith(items: [card.items[1]], note: 'Obrigada');
    when(() => cards.saveDraft(any())).thenAnswer((_) async => saved);
    final cubit = await loaded()
      ..startEditing()
      ..removeItem(0)
      ..removeItem(1)
      ..onNoteChanged('Obrigada');
    await cubit.save();

    verify(() => cards.saveDraft(any())).called(1);
    expect(cubit.state.card, Success(saved));
    expect(cubit.state.isEditing, isFalse);
  });

  test('a failed save keeps the edits so nothing is lost', () async {
    when(() => cards.saveDraft(any())).thenAnswer((_) async => throw Exception());
    final cubit = await loaded()
      ..startEditing()
      ..removeItem(0);
    await cubit.save();

    expect(cubit.state.isEditing, isTrue);
    expect(cubit.state.draft!.items, hasLength(2));
  });

  test('a connected partner is detected', () async {
    final cubit = await loaded();

    expect(cubit.state.isPaired, isTrue);
  });

  test('without a partner the card cannot be marked as connected', () async {
    when(() => pairing.getPartner()).thenAnswer((_) async => null);
    final cubit = await loaded();

    expect(cubit.state.isPaired, isFalse);
  });

  test('send marks the card as sent', () async {
    final sent = SundayCard(id: 'c1', status: 'sent', weekStart: card.weekStart, items: card.items);
    when(() => cards.send('c1')).thenAnswer((_) async => sent);
    final cubit = await loaded();

    await cubit.send();

    expect(cubit.state.card, Success(sent));
  });

  test('a double tap on send sends once', () async {
    final sent = SundayCard(id: 'c1', status: 'sent', weekStart: card.weekStart, items: card.items);
    when(() => cards.send('c1')).thenAnswer((_) async => sent);
    final cubit = await loaded();

    await Future.wait([cubit.send(), cubit.send()]);

    verify(() => cards.send('c1')).called(1);
  });

  test('a failed send leaves the draft in place to retry', () async {
    when(() => cards.send('c1')).thenAnswer((_) async => throw Exception());
    final cubit = await loaded();

    await cubit.send();

    expect(cubit.state.card, Success(card));
    expect(cubit.state.deliverAction, const Initial());
  });

  test('hold keeps the card and can be followed by a send', () async {
    final held = SundayCard(id: 'c1', status: 'held', weekStart: card.weekStart, items: card.items);
    final sent = SundayCard(id: 'c1', status: 'sent', weekStart: card.weekStart, items: card.items);
    when(() => cards.hold('c1')).thenAnswer((_) async => held);
    when(() => cards.send('c1')).thenAnswer((_) async => sent);
    final cubit = await loaded();

    await cubit.hold();
    expect((cubit.state.card as Success<SundayCard>).value.isHeld, isTrue);

    await cubit.send();
    expect((cubit.state.card as Success<SundayCard>).value.isSent, isTrue);
  });

  test('a sent card is never sent again', () async {
    final sent = SundayCard(id: 'c1', status: 'sent', weekStart: card.weekStart, items: card.items);
    when(() => cards.getDraft()).thenAnswer((_) async => sent);
    final cubit = await loaded();

    await cubit.send();

    verifyNever(() => cards.send(any()));
  });
}
