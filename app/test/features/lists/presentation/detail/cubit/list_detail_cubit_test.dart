import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/detail/cubit/list_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockListsRepository() extends Mock implements ListsRepository;

void main() {
  late ListsRepository repository;

  const list = CoupleList(
    id: 'l1',
    title: 'Viagens',
    kind: 'travel',
    coupleId: 'couple-1',
    isMine: true,
  );
  const privateList = CoupleList(id: 'l1', title: 'Viagens', kind: 'travel', isMine: true);
  const lisbon = ListItem(id: 'i1', listId: 'l1', title: 'Lisboa', status: 'dream', position: 0);
  const chapada = ListItem(
    id: 'i2',
    listId: 'l1',
    title: 'Chapada',
    status: 'planned',
    position: 1,
  );
  const paraty = ListItem(id: 'i3', listId: 'l1', title: 'Paraty', status: 'done', position: 2);
  const detail = ListDetail(
    list: list,
    items: [lisbon, chapada, paraty],
    currentCoupleId: 'couple-1',
  );

  setUp(() {
    repository = _MockListsRepository();
    when(() => repository.getList(any())).thenAnswer((_) async => detail);
    when(repository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(
      () => repository.setListVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.addItem(
        id: any(named: 'id'),
        listId: any(named: 'listId'),
        title: any(named: 'title'),
        position: any(named: 'position'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.setItemStatus(
        id: any(named: 'id'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => repository.setItemPosition(
        id: any(named: 'id'),
        position: any(named: 'position'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteItem(any())).thenAnswer((_) async {});
  });

  ListDetailCubit build() => ListDetailCubit(listsRepository: repository);

  List<ListItem> items(ListDetailCubit cubit) =>
      (cubit.state.detail as Success<ListDetail>).value.items;

  test('load reads the list and its items', () async {
    final cubit = build();
    addTearDown(cubit.close);

    await cubit.load('l1');

    expect(cubit.state.listId, 'l1');
    expect(cubit.state.title, 'Viagens');
    expect(items(cubit), [lisbon, chapada, paraty]);
  });

  test('adding an item puts it after the last position', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.addItem('  Paraty  ');

    final created = items(cubit).last;
    expect(created.title, 'Paraty');
    expect(created.status, 'dream');
    expect(created.position, 3);
    verify(() => repository.addItem(id: created.id, listId: 'l1', title: 'Paraty', position: 3))
        .called(1);
  });

  test('an empty item is not added', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.addItem('   ');

    verifyNever(
      () => repository.addItem(
        id: any(named: 'id'),
        listId: any(named: 'listId'),
        title: any(named: 'title'),
        position: any(named: 'position'),
      ),
    );
  });

  test('checking an item marks it done and unchecking plans it again', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.toggleDone(lisbon);
    expect(items(cubit).first.status, 'done');
    verify(() => repository.setItemStatus(id: 'i1', status: 'done')).called(1);

    await cubit.toggleDone(items(cubit).first);
    expect(items(cubit).first.status, 'planned');
    verify(() => repository.setItemStatus(id: 'i1', status: 'planned')).called(1);
  });

  test('moving an item up renumbers every position in order', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.move(paraty, up: true);

    expect(items(cubit).map((item) => item.id), ['i1', 'i3', 'i2']);
    expect(items(cubit).map((item) => item.position), [0, 1, 2]);
    verifyInOrder([
      () => repository.setItemPosition(id: 'i3', position: 1),
      () => repository.setItemPosition(id: 'i2', position: 2),
    ]);
  });

  test('moving the first item up does nothing', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.move(lisbon, up: true);

    expect(items(cubit), [lisbon, chapada, paraty]);
    verifyNever(
      () => repository.setItemPosition(
        id: any(named: 'id'),
        position: any(named: 'position'),
      ),
    );
  });

  test('deleting an item removes it from the list', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.deleteItem(chapada);

    expect(items(cubit), [lisbon, paraty]);
    verify(() => repository.deleteItem('i2')).called(1);
  });

  test('a failed add puts the list back and reports it', () async {
    when(
      () => repository.addItem(
        id: any(named: 'id'),
        listId: any(named: 'listId'),
        title: any(named: 'title'),
        position: any(named: 'position'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.addItem('Paraty');

    expect(items(cubit), [lisbon, chapada, paraty]);
    expect(cubit.state.changeAction, isA<Initial>());
  });

  test('a failed reorder restores the previous order', () async {
    when(
      () => repository.setItemPosition(
        id: any(named: 'id'),
        position: any(named: 'position'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.move(paraty, up: true);

    expect(items(cubit), [lisbon, chapada, paraty]);
    expect(items(cubit).map((item) => item.position), [0, 1, 2]);
  });

  test('the author can make a shared list private', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.setVisibility(isShared: false);

    final updated = (cubit.state.detail as Success<ListDetail>).value;
    expect(updated.list.isShared, isFalse);
    expect(updated.currentCoupleId, 'couple-1');
    verify(() => repository.setListVisibility(id: 'l1', coupleId: null)).called(1);
  });

  test('the author can share a private list again', () async {
    when(() => repository.getList(any())).thenAnswer(
      (_) async => const ListDetail(
        list: privateList,
        items: [lisbon, chapada, paraty],
        currentCoupleId: 'couple-1',
      ),
    );
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.setVisibility(isShared: true);

    final updated = (cubit.state.detail as Success<ListDetail>).value;
    expect(updated.list.isShared, isTrue);
    verify(() => repository.setListVisibility(id: 'l1', coupleId: 'couple-1')).called(1);
  });

  test("a partner's list keeps its visibility", () async {
    when(() => repository.getList(any())).thenAnswer(
      (_) async => const ListDetail(
        list: CoupleList(id: 'l1', title: 'Viagens', kind: 'travel', coupleId: 'couple-1'),
        items: [lisbon, chapada, paraty],
        currentCoupleId: 'couple-1',
      ),
    );
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.setVisibility(isShared: false);

    verifyNever(
      () => repository.setListVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    );
  });

  test('a failed visibility change restores the previous list', () async {
    when(
      () => repository.setListVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    await cubit.setVisibility(isShared: false);

    final current = (cubit.state.detail as Success<ListDetail>).value;
    expect(current.list.isShared, isTrue);
    expect(cubit.state.changeAction, isA<Initial>());
  });

  test('a list deleted while it is open becomes a not found failure', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('l1');

    when(() => repository.getList(any()))
        .thenThrow(const LocalizedException(l10nKey: listNotFoundCode));
    await cubit.refresh();

    expect(cubit.state.detail, isA<Failure>());
  });
}
