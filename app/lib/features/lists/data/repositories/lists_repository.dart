import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/mappers/list_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/lists/data/mappers/list_mapper.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class ListsRepository({
  required final ListsDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
}) {
  final Logger _logger = Logger('ListsRepository');

  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() => _togetherRepository.getCoupleId();

  Future<List<CoupleList>> getLists() => _run(
    'read lists',
    () async => [for (final node in await _dataSource.getLists()) node.toModel()],
  );

  Future<ListDetail> getList(String id) => _run('read a list', () async {
    final node = await _dataSource.getList(id);
    if (node == null) throw const LocalizedException(l10nKey: listNotFoundCode);

    return ListDetail(
      list: node.toModel(),
      items: [
        if (node.listItemsCollection case final items?)
          for (final edge in items.edges) edge.node.toModel(),
      ],
      currentCoupleId: await _togetherRepository.getCoupleId(),
    );
  });

  /// Creates the list and returns it as the server stored it.
  Future<CoupleList> createList({
    required String id,
    required String title,
    required ListKind kind,
    String? coupleId,
  }) => _run(
    'create a list',
    () async => (await _dataSource.createList(
      id: id,
      title: title.trim(),
      kind: kind.toRemote(),
      coupleId: coupleId,
    )).toModel(),
  );

  Future<CoupleList> renameList({required String id, required String title}) => _run(
    'rename a list',
    () async => (await _dataSource.renameList(id: id, title: title.trim())).toModel(),
  );

  Future<void> deleteList(String id) => _run('delete a list', () => _dataSource.deleteList(id));

  Future<CoupleList> setListVisibility({required String id, String? coupleId}) => _run(
    'change a list visibility',
    () async => (await _dataSource.setListVisibility(id: id, coupleId: coupleId)).toModel(),
  );

  Future<ListItem> addItem({
    required String id,
    required String listId,
    required String title,
    required int position,
  }) => _run(
    'add an item',
    () async => (await _dataSource.addItem(
      id: id,
      listId: listId,
      title: title.trim(),
      position: position,
    )).toModel(),
  );

  Future<ListItem> setItemStatus({required String id, required ListItemStatus status}) => _run(
    'update an item',
    () async => (await _dataSource.setItemStatus(id: id, status: status.toRemote())).toModel(),
  );

  /// Moves the items to the order of [itemIds] in one request and returns the whole list in order.
  Future<List<ListItem>> reorderItems({required String listId, required List<String> itemIds}) =>
      _run(
        'reorder items',
        () async => [
          for (final node in await _dataSource.reorderItems(listId: listId, itemIds: itemIds))
            node.toModel(),
        ],
      );

  Future<void> deleteItem(String id) => _run('delete an item', () => _dataSource.deleteItem(id));

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
