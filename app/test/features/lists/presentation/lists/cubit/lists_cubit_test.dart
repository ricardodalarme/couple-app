import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/cubit/lists_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockListsRepository() extends Mock implements ListsRepository;

void main() {
  late ListsRepository repository;

  const shared = CoupleList(
    id: 'l1',
    title: 'Viagens',
    kind: ListKind.travel,
    coupleId: 'couple-1',
    isMine: true,
  );
  const solo = CoupleList(id: 'l2', title: 'Filmes', kind: ListKind.movies);

  setUp(() {
    repository = _MockListsRepository();
    when(repository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(repository.getLists).thenAnswer((_) async => [shared, solo]);
    when(
      () => repository.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.renameList(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteList(any())).thenAnswer((_) async {});
  });

  ListsCubit build() => ListsCubit(listsRepository: repository);

  test('load reads the lists and whether they are shared', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load();

    expect(cubit.state.currentLists, [shared, solo]);
    expect(cubit.state.coupleId, 'couple-1');
    expect(cubit.state.isShared, isTrue);
  });

  test('create adds a shared list when the person chooses to share it', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.create(title: '  Restaurantes  ', kind: ListKind.restaurants, isShared: true);

    final created = cubit.state.currentLists.first;
    expect(created.title, 'Restaurantes');
    expect(created.kind, ListKind.restaurants);
    expect(created.isShared, isTrue);
    expect(created.isMine, isTrue);
    expect(cubit.state.currentLists, hasLength(3));
    verify(
      () => repository.createList(
        id: created.id,
        title: 'Restaurantes',
        kind: ListKind.restaurants,
        coupleId: 'couple-1',
      ),
    ).called(1);
  });

  test('create keeps a private list for the person alone', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: false);

    final created = cubit.state.currentLists.first;
    expect(created.isShared, isFalse);
    verify(
      () => repository.createList(
        id: created.id,
        title: 'Viagens',
        kind: ListKind.travel,
        coupleId: null,
      ),
    ).called(1);
  });

  test('a shared create while alone stays private', () async {
    when(repository.getCoupleId).thenAnswer((_) async => null);
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: true);

    final created = cubit.state.currentLists.first;
    expect(created.isShared, isFalse);
    verify(
      () => repository.createList(
        id: created.id,
        title: 'Viagens',
        kind: ListKind.travel,
        coupleId: null,
      ),
    ).called(1);
  });

  test('an empty title is not created', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.create(title: '   ', kind: ListKind.custom, isShared: false);

    verifyNever(
      () => repository.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('create before the lists load does nothing', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: true);

    expect(cubit.state.lists, isA<Loading>());
    verifyNever(
      () => repository.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('create after a failed load keeps the error on screen', () async {
    when(repository.getLists).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    final failure = cubit.state.lists;

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: true);

    expect(cubit.state.lists, failure);
    expect(cubit.state.lists, isA<Failure>());
    verifyNever(
      () => repository.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('a failed create puts the previous lists back and reports it', () async {
    when(
      () => repository.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: false);

    expect(cubit.state.currentLists, [shared, solo]);
    expect(cubit.state.createAction, isA<Initial>());
  });

  test('a failed couple lookup restores the loaded lists', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    when(repository.getCoupleId).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));

    await cubit.create(title: 'Viagens', kind: ListKind.travel, isShared: true);

    expect(cubit.state.lists, isA<Success<List<CoupleList>>>());
    expect(cubit.state.currentLists, [shared, solo]);
    expect(cubit.state.createAction, isA<Initial>());
  });

  test('rename updates the list and keeps it on failure', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.rename(shared, '  Nossa viagem  ');

    expect(cubit.state.currentLists.first.title, 'Nossa viagem');
    verify(() => repository.renameList(id: 'l1', title: 'Nossa viagem')).called(1);
  });

  test('a failed rename restores the old title', () async {
    when(
      () => repository.renameList(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.rename(shared, 'Nossa viagem');

    expect(cubit.state.currentLists.first.title, 'Viagens');
    expect(cubit.state.changeAction, isA<Initial>());
  });

  test('delete removes the list and puts it back on failure', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();

    await cubit.delete(shared);
    expect(cubit.state.currentLists, [solo]);

    when(() => repository.deleteList(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    await cubit.delete(solo);
    expect(cubit.state.currentLists, [solo]);
  });
}
