import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/features/gifts/data/repositories/gifts_repository.dart';
import 'package:flutter_bloc_starter/features/gifts/presentation/gifts/cubit/gifts_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockGiftsRepository() extends Mock implements GiftsRepository;

void main() {
  late GiftsRepository repository;

  const shared = GiftIdea(id: 'g1', title: 'Livro', coupleId: 'couple-1', isMine: true);
  const partnerShared = GiftIdea(id: 'g2', title: 'Vinil', coupleId: 'couple-1');
  const private = GiftIdea(id: 'g3', title: 'Caneca', isMine: true);

  setUp(() {
    repository = _MockGiftsRepository();
    when(repository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(repository.getGiftIdeas).thenAnswer((_) async => [shared, partnerShared, private]);
    when(
      () => repository.addGiftWish(
        id: any(named: 'id'),
        title: any(named: 'title'),
        note: any(named: 'note'),
        budget: any(named: 'budget'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.updateGiftWish(
        id: any(named: 'id'),
        title: any(named: 'title'),
        note: any(named: 'note'),
        budget: any(named: 'budget'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteGiftWish(any())).thenAnswer((_) async {});
    when(
      () => repository.setGiftWishVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});
  });

  GiftsCubit build() => GiftsCubit(giftsRepository: repository);

  test('load reads the wishes and the couple id', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.currentGifts, [shared, partnerShared, private]);
    expect(cubit.state.myGifts, [shared, private]);
    expect(cubit.state.partnerGifts, [partnerShared]);
    expect(cubit.state.coupleId, 'couple-1');
    expect(cubit.state.hasPartner, isTrue);
  });

  test('a reload after unpair clears the couple id', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    expect(cubit.state.hasPartner, isTrue);

    when(repository.getCoupleId).thenAnswer((_) async => null);
    await cubit.load();

    expect(cubit.state.coupleId, isNull);
    expect(cubit.state.hasPartner, isFalse);
  });

  test('copyWith can clear the couple id', () {
    const state = GiftsState(coupleId: 'couple-1');

    expect(state.copyWith().coupleId, 'couple-1');
    expect(state.copyWith(coupleId: null).coupleId, isNull);
  });

  test('a new wish is private by default', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.add(title: '  Fone  ', isShared: false);

    final created = cubit.state.currentGifts.first;
    expect(created.title, 'Fone');
    expect(created.isShared, isFalse);
    expect(created.isMine, isTrue);
    verify(
      () => repository.addGiftWish(
        id: created.id,
        title: 'Fone',
        note: null,
        budget: null,
        coupleId: null,
      ),
    ).called(1);
  });

  test('a shared wish is sent with the current couple id', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.add(title: 'Fone', isShared: true, note: '  Sem fio  ', budget: 'medium');

    final created = cubit.state.currentGifts.first;
    expect(created.isShared, isTrue);
    expect(created.note, 'Sem fio');
    expect(created.budget, 'medium');
    verify(
      () => repository.addGiftWish(
        id: created.id,
        title: 'Fone',
        note: 'Sem fio',
        budget: 'medium',
        coupleId: 'couple-1',
      ),
    ).called(1);
  });

  test('a shared wish while alone stays private', () async {
    when(repository.getCoupleId).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.add(title: 'Fone', isShared: true);

    final created = cubit.state.currentGifts.first;
    expect(created.isShared, isFalse);
    verify(
      () => repository.addGiftWish(
        id: created.id,
        title: 'Fone',
        note: null,
        budget: null,
        coupleId: null,
      ),
    ).called(1);
  });

  test('an empty title is not added', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.add(title: '   ', isShared: false);

    verifyNever(
      () => repository.addGiftWish(
        id: any(named: 'id'),
        title: any(named: 'title'),
        note: any(named: 'note'),
        budget: any(named: 'budget'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('editing changes the details and keeps visibility', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.edit(shared, title: '  Livro de poemas  ', note: 'Capa dura', budget: 'low');

    final edited = cubit.state.currentGifts.first;
    expect(edited.title, 'Livro de poemas');
    expect(edited.note, 'Capa dura');
    expect(edited.budget, 'low');
    expect(edited.isShared, isTrue);
    verify(
      () => repository.updateGiftWish(
        id: 'g1',
        title: 'Livro de poemas',
        note: 'Capa dura',
        budget: 'low',
      ),
    ).called(1);
  });

  test('a partner wish cannot be edited', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.edit(partnerShared, title: 'Outro');

    verifyNever(
      () => repository.updateGiftWish(
        id: any(named: 'id'),
        title: any(named: 'title'),
        note: any(named: 'note'),
        budget: any(named: 'budget'),
      ),
    );
  });

  test('delete removes the wish and puts it back on failure', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.delete(private);
    expect(cubit.state.currentGifts, [shared, partnerShared]);

    when(() => repository.deleteGiftWish(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    await cubit.delete(shared);
    expect(cubit.state.currentGifts, [shared, partnerShared]);
  });

  test('sharing and unsharing changes the couple id', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.setVisibility(private, isShared: true);
    expect(cubit.state.currentGifts.last.isShared, isTrue);
    verify(() => repository.setGiftWishVisibility(id: 'g3', coupleId: 'couple-1')).called(1);

    await cubit.setVisibility(shared, isShared: false);
    expect(cubit.state.currentGifts.first.isShared, isFalse);
    verify(() => repository.setGiftWishVisibility(id: 'g1', coupleId: null)).called(1);
  });

  test('sharing while alone does nothing', () async {
    when(repository.getCoupleId).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.setVisibility(private, isShared: true);

    expect(cubit.state.currentGifts.last.isShared, isFalse);
    verifyNever(
      () => repository.setGiftWishVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('a failed add restores the previous wishes and reports it', () async {
    when(
      () => repository.addGiftWish(
        id: any(named: 'id'),
        title: any(named: 'title'),
        note: any(named: 'note'),
        budget: any(named: 'budget'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.add(title: 'Fone', isShared: false);

    expect(cubit.state.currentGifts, [shared, partnerShared, private]);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('a failed load is reported', () async {
    when(repository.getGiftIdeas).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.gifts, isA<Failure>());
  });
}
