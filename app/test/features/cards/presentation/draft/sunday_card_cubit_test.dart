import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
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
    when(() => cards.getDraft()).thenAnswer((_) async => card);
    when(
      () => profile.getMyProfile(),
    ).thenAnswer((_) async => const Profile(id: 'me', avatarKind: 'initials', displayName: 'Ana'));
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose, partnerName: 'Rui'));
  });

  SundayCardCubit build() => SundayCardCubit(cardsRepository: cards, profileRepository: profile);

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
}
