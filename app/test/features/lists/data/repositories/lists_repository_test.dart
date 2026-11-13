import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/queries/generated/ListDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/queries/generated/Lists.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockListsDataSource() extends Mock implements ListsDataSource;

class _MockTogetherRepository() extends Mock implements TogetherRepository;

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late ListsDataSource dataSource;
  late TogetherRepository togetherRepository;
  late AuthenticationRepository authenticationRepository;
  late ListsRepository repository;

  setUp(() {
    dataSource = _MockListsDataSource();
    togetherRepository = _MockTogetherRepository();
    authenticationRepository = _MockAuthenticationRepository();
    repository = ListsRepository(
      dataSource: dataSource,
      togetherRepository: togetherRepository,
      authenticationRepository: authenticationRepository,
    );
    when(togetherRepository.getCoupleId).thenAnswer((_) async => null);
    when(() => authenticationRepository.currentUserId).thenReturn('me');
  });

  QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode item({
    String id = 'i1',
    String listId = 'l1',
    String title = 'Lisboa',
    String status = 'dream',
    int position = 0,
  }) => QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode(
    id: id,
    listId: listId,
    title: title,
    status: status,
    position: position,
  );

  QueryListDetaillistsCollectionedgesnode list({
    String id = 'l1',
    String authorId = 'me',
    String title = 'Viagens',
    String kind = 'travel',
    String? coupleId = 'couple-1',
    List<QueryListDetaillistsCollectionedgesnodelistItemsCollectionedgesnode> items = const [],
  }) => QueryListDetaillistsCollectionedgesnode(
    id: id,
    authorId: authorId,
    title: title,
    kind: kind,
    coupleId: coupleId,
    listItemsCollection: QueryListDetaillistsCollectionedgesnodelistItemsCollection(
      edges: [
        for (final node in items)
          QueryListDetaillistsCollectionedgesnodelistItemsCollectionedges(node: node),
      ],
    ),
  );

  test('maps lists with their sharing state', () async {
    when(togetherRepository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(dataSource.getLists).thenAnswer(
      (_) async => [
        QueryListslistsCollectionedgesnode(
          id: 'l1',
          authorId: 'me',
          title: 'Viagens',
          kind: 'travel',
          coupleId: 'couple-1',
        ),
        QueryListslistsCollectionedgesnode(
          id: 'l2',
          authorId: 'partner',
          title: 'Filmes',
          kind: 'movies',
        ),
      ],
    );

    final lists = await repository.getLists();

    expect(lists, hasLength(2));
    expect(lists.first.id, 'l1');
    expect(lists.first.title, 'Viagens');
    expect(lists.first.kind, 'travel');
    expect(lists.first.isShared, isTrue);
    expect(lists.first.isMine, isTrue);
    expect(lists.last.isShared, isFalse);
    expect(lists.last.isMine, isFalse);
  });

  test('a list from a couple that is no longer current is private', () async {
    when(togetherRepository.getCoupleId).thenAnswer((_) async => 'couple-2');
    when(dataSource.getLists).thenAnswer(
      (_) async => [
        QueryListslistsCollectionedgesnode(
          id: 'l1',
          authorId: 'me',
          title: 'Viagens',
          kind: 'travel',
          coupleId: 'couple-1',
        ),
      ],
    );

    final lists = await repository.getLists();

    expect(lists.single.isShared, isFalse);
  });

  test('maps a list and its items in server order', () async {
    when(togetherRepository.getCoupleId).thenAnswer((_) async => 'couple-1');
    when(() => dataSource.getList(any())).thenAnswer(
      (_) async => list(
        items: [
          item(id: 'i1', title: 'Lisboa', status: 'planned', position: 0),
          item(id: 'i2', title: 'Chapada', status: 'dream', position: 1),
        ],
      ),
    );

    final detail = await repository.getList('l1');

    expect(detail.list.title, 'Viagens');
    expect(detail.list.isShared, isTrue);
    expect(detail.list.isMine, isTrue);
    expect(detail.currentCoupleId, 'couple-1');
    expect(detail.items, hasLength(2));
    expect(detail.items.first.title, 'Lisboa');
    expect(detail.items.first.status, 'planned');
    expect(detail.items.last.position, 1);
    verify(() => dataSource.getList('l1')).called(1);
  });

  test('a list that is no longer visible is reported as not found', () {
    when(() => dataSource.getList(any()))
        .thenAnswer((_) => Future<QueryListDetaillistsCollectionedgesnode?>.syncValue(null));

    expect(
      repository.getList('l1'),
      throwsA(
        isA<LocalizedException>().having((error) => error.l10nKey, 'l10nKey', listNotFoundCode),
      ),
    );
  });

  test('creating a shared list forwards the couple id', () async {
    when(
      () => dataSource.createList(
        id: any(named: 'id'),
        title: any(named: 'title'),
        kind: any(named: 'kind'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});

    await repository.createList(
      id: 'l1',
      title: '  Viagens  ',
      kind: 'travel',
      coupleId: 'couple-1',
    );

    verify(
      () => dataSource.createList(id: 'l1', title: 'Viagens', kind: 'travel', coupleId: 'couple-1'),
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
    ).thenAnswer((_) async {});

    await repository.createList(id: 'l1', title: 'Viagens', kind: 'travel');

    verify(() => dataSource.createList(id: 'l1', title: 'Viagens', kind: 'travel', coupleId: null))
        .called(1);
  });

  test('rename and delete forward the list id', () async {
    when(
      () => dataSource.renameList(
        id: any(named: 'id'),
        title: any(named: 'title'),
      ),
    ).thenAnswer((_) async {});
    when(() => dataSource.deleteList(any())).thenAnswer((_) async {});

    await repository.renameList(id: 'l1', title: '  Nossa viagem ');
    await repository.deleteList('l1');

    verify(() => dataSource.renameList(id: 'l1', title: 'Nossa viagem')).called(1);
    verify(() => dataSource.deleteList('l1')).called(1);
  });

  test('switching visibility forwards the target couple id', () async {
    when(
      () => dataSource.setListVisibility(
        id: any(named: 'id'),
        coupleId: any(named: 'coupleId'),
      ),
    ).thenAnswer((_) async {});

    await repository.setListVisibility(id: 'l1', coupleId: 'couple-1');
    await repository.setListVisibility(id: 'l1');

    verify(() => dataSource.setListVisibility(id: 'l1', coupleId: 'couple-1')).called(1);
    verify(() => dataSource.setListVisibility(id: 'l1', coupleId: null)).called(1);
  });

  test('item actions forward their values', () async {
    when(
      () => dataSource.addItem(
        id: any(named: 'id'),
        listId: any(named: 'listId'),
        title: any(named: 'title'),
        position: any(named: 'position'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => dataSource.setItemStatus(
        id: any(named: 'id'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => dataSource.setItemPosition(
        id: any(named: 'id'),
        position: any(named: 'position'),
      ),
    ).thenAnswer((_) async {});
    when(() => dataSource.deleteItem(any())).thenAnswer((_) async {});

    await repository.addItem(id: 'i1', listId: 'l1', title: '  Lisboa ', position: 2);
    await repository.setItemStatus(id: 'i1', status: 'done');
    await repository.setItemPosition(id: 'i1', position: 0);
    await repository.deleteItem('i1');

    verify(() => dataSource.addItem(id: 'i1', listId: 'l1', title: 'Lisboa', position: 2))
        .called(1);
    verify(() => dataSource.setItemStatus(id: 'i1', status: 'done')).called(1);
    verify(() => dataSource.setItemPosition(id: 'i1', position: 0)).called(1);
    verify(() => dataSource.deleteItem('i1')).called(1);
  });
}
