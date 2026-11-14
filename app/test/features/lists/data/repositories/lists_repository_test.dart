import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListItemFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/queries/generated/ListDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockListsDataSource() extends Mock implements ListsDataSource;

class _MockTogetherRepository() extends Mock implements TogetherRepository;

void main() {
  late ListsDataSource dataSource;
  late TogetherRepository togetherRepository;
  late ListsRepository repository;

  setUp(() {
    dataSource = _MockListsDataSource();
    togetherRepository = _MockTogetherRepository();
    repository = ListsRepository(dataSource: dataSource, togetherRepository: togetherRepository);
    when(togetherRepository.getCoupleId).thenAnswer((_) async => null);
  });

  FragmentListItemFragment item({
    String id = 'i1',
    String listId = 'l1',
    String title = 'Lisboa',
    EnumListItemStatus status = EnumListItemStatus.dream,
    int position = 0,
  }) => FragmentListItemFragment(
    id: id,
    listId: listId,
    title: title,
    status: status,
    position: position,
  );

  FragmentListFragment list({
    String id = 'l1',
    String title = 'Viagens',
    EnumListKind kind = EnumListKind.travel,
    bool isMine = true,
    bool isShared = false,
  }) => FragmentListFragment(id: id, title: title, kind: kind, isMine: isMine, isShared: isShared);

  QueryListDetaillistsByPk detail({
    bool isMine = true,
    bool isShared = true,
    List<FragmentListItemFragment> items = const [],
  }) => QueryListDetaillistsByPk(
    id: 'l1',
    title: 'Viagens',
    kind: EnumListKind.travel,
    isMine: isMine,
    isShared: isShared,
    listItemsCollection: QueryListDetaillistsByPklistItemsCollection(
      edges: [
        for (final node in items) QueryListDetaillistsByPklistItemsCollectionedges(node: node),
      ],
    ),
  );

  test('maps lists with the sharing and authorship the server computed', () async {
    when(dataSource.getLists).thenAnswer(
      (_) async => [
        list(isShared: true),
        list(id: 'l2', title: 'Filmes', kind: EnumListKind.movies, isMine: false),
      ],
    );

    final lists = await repository.getLists();

    expect(lists, hasLength(2));
    expect(lists.first.id, 'l1');
    expect(lists.first.title, 'Viagens');
    expect(lists.first.kind, ListKind.travel);
    expect(lists.first.isShared, isTrue);
    expect(lists.first.isMine, isTrue);
    expect(lists.last.isShared, isFalse);
    expect(lists.last.isMine, isFalse);
  });

  test('reading lists does not ask for the couple id', () async {
    when(dataSource.getLists).thenAnswer((_) async => [list()]);

    await repository.getLists();

    verifyNever(togetherRepository.getCoupleId);
  });

  test('a missing computed flag reads as false', () async {
    when(dataSource.getLists).thenAnswer(
      (_) async => [FragmentListFragment(id: 'l1', title: 'Viagens', kind: EnumListKind.travel)],
    );

    final lists = await repository.getLists();

    expect(lists.single.isShared, isFalse);
    expect(lists.single.isMine, isFalse);
  });

  test('maps a list and its items in server order', () async {
    when(togetherRepository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(() => dataSource.getList(any())).thenAnswer(
      (_) async => detail(
        items: [
          item(id: 'i1', title: 'Lisboa', status: EnumListItemStatus.planned, position: 0),
          item(id: 'i2', title: 'Chapada', status: EnumListItemStatus.dream, position: 1),
        ],
      ),
    );

    final result = await repository.getList('l1');

    expect(result.list.title, 'Viagens');
    expect(result.list.isShared, isTrue);
    expect(result.list.isMine, isTrue);
    expect(result.currentCoupleId, 'couple-1');
    expect(result.items, hasLength(2));
    expect(result.items.first.title, 'Lisboa');
    expect(result.items.first.status, ListItemStatus.planned);
    expect(result.items.last.position, 1);
    verify(() => dataSource.getList('l1')).called(1);
  });

  test('a list that is no longer visible is reported as not found', () {
    when(() => dataSource.getList(any()))
        .thenAnswer((_) => Future<QueryListDetaillistsByPk?>.syncValue(null));

    expect(
      repository.getList('l1'),
      throwsA(
        isA<LocalizedException>().having((error) => error.l10nKey, 'l10nKey', listNotFoundCode),
      ),
    );
  });

  test('creating a shared list forwards the couple id and returns the stored list', () async {
    when(
      () => dataSource.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async => list(isShared: true));

    final saved = await repository.createList(
      id: 'l1',
      title: '  Viagens  ',
      kind: ListKind.travel,
      coupleId: 'couple-1',
    );

    expect(saved.isShared, isTrue);
    verify(
      () => dataSource.createList(
        id: 'l1',
        title: 'Viagens',
        kind: EnumListKind.travel,
        coupleId: 'couple-1',
      ),
    ).called(1);
  });

  test('creating a private list sends no couple id', () async {
    when(
      () => dataSource.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async => list());

    await repository.createList(id: 'l1', title: 'Viagens', kind: ListKind.travel);

    verify(
      () => dataSource.createList(
        id: 'l1',
        title: 'Viagens',
        kind: EnumListKind.travel,
        coupleId: null,
      ),
    ).called(1);
  });

  test('rename returns the stored list and delete forwards the list id', () async {
    when(
      () => dataSource.renameList(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    ).thenAnswer((_) async => list(title: 'Nossa viagem'));
    when(() => dataSource.deleteList(any())).thenAnswer((_) async {});

    final renamed = await repository.renameList(id: 'l1', title: '  Nossa viagem ');
    await repository.deleteList('l1');

    expect(renamed.title, 'Nossa viagem');
    verify(() => dataSource.renameList(id: 'l1', title: 'Nossa viagem')).called(1);
    verify(() => dataSource.deleteList('l1')).called(1);
  });

  test('switching visibility forwards the target couple id and returns the stored list', () async {
    when(
      () => dataSource.setListVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async => list(isShared: true));

    final shared = await repository.setListVisibility(id: 'l1', coupleId: 'couple-1');
    await repository.setListVisibility(id: 'l1');

    expect(shared.isShared, isTrue);
    verify(() => dataSource.setListVisibility(id: 'l1', coupleId: 'couple-1')).called(1);
    verify(() => dataSource.setListVisibility(id: 'l1', coupleId: null)).called(1);
  });

  test('item actions forward their values and return the stored item', () async {
    when(
      () => dataSource.addItem(
        id: any(named: 'id'),
        listId: any(named: 'listId'),
        title: any(named: 'title'),
        position: any(named: 'position'),
      ),
    ).thenAnswer((_) async => item(position: 2));
    when(
      () => dataSource.setItemStatus(
        id: any(named: 'id'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async => item(status: EnumListItemStatus.done));
    when(() => dataSource.deleteItem(any())).thenAnswer((_) async {});

    final added = await repository.addItem(id: 'i1', listId: 'l1', title: '  Lisboa ', position: 2);
    final changed = await repository.setItemStatus(id: 'i1', status: ListItemStatus.done);
    await repository.deleteItem('i1');

    expect(added.position, 2);
    expect(changed.status, ListItemStatus.done);
    verify(() => dataSource.addItem(id: 'i1', listId: 'l1', title: 'Lisboa', position: 2))
        .called(1);
    verify(() => dataSource.setItemStatus(id: 'i1', status: EnumListItemStatus.done)).called(1);
    verify(() => dataSource.deleteItem('i1')).called(1);
  });

  test('reordering sends the new order once and returns the stored list', () async {
    when(
      () => dataSource.reorderItems(
        listId: any(named: 'listId'),
        itemIds: any(named: 'itemIds'),
      ),
    ).thenAnswer((_) async => [item(id: 'i2', position: 0), item(id: 'i1', position: 1)]);

    final items = await repository.reorderItems(listId: 'l1', itemIds: ['i2', 'i1']);

    expect([for (final stored in items) stored.id], ['i2', 'i1']);
    verify(() => dataSource.reorderItems(listId: 'l1', itemIds: ['i2', 'i1'])).called(1);
  });
}
