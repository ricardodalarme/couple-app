import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class ListsRepository({
  required final ListsDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('ListsRepository');

  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() => _togetherRepository.getCoupleId();

  Future<List<CoupleList>> getLists() async {
    try {
      final coupleId = await _togetherRepository.getCoupleId();
      final selfId = _authenticationRepository.currentUserId;

      return [
        for (final node in await _dataSource.getLists())
          CoupleList(
            id: node.id,
            title: node.title,
            kind: node.kind,
            coupleId: node.coupleId == coupleId ? node.coupleId : null,
            isMine: node.authorId == selfId,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read lists', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<ListDetail> getList(String id) async {
    try {
      final node = await _dataSource.getList(id);
      if (node == null) throw const LocalizedException(l10nKey: listNotFoundCode);
      final edges = node.listItemsCollection?.edges;
      final coupleId = await _togetherRepository.getCoupleId();
      final selfId = _authenticationRepository.currentUserId;

      return ListDetail(
        list: CoupleList(
          id: node.id,
          title: node.title,
          kind: node.kind,
          coupleId: node.coupleId == coupleId ? node.coupleId : null,
          isMine: node.authorId == selfId,
        ),
        items: [
          if (edges != null)
            for (final edge in edges)
              ListItem(
                id: edge.node.id,
                listId: edge.node.listId,
                title: edge.node.title,
                status: edge.node.status,
                position: edge.node.position,
              ),
        ],
        currentCoupleId: coupleId,
      );
    } catch (e, stack) {
      _logger.error('Failed to read a list', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> createList({
    required String id,
    required String title,
    required String kind,
    String? coupleId,
  }) => _run(
    'create a list',
    () => _dataSource.createList(id: id, title: title.trim(), kind: kind, coupleId: coupleId),
  );

  Future<void> renameList({required String id, required String title}) =>
      _run('rename a list', () => _dataSource.renameList(id: id, title: title.trim()));

  Future<void> deleteList(String id) => _run('delete a list', () => _dataSource.deleteList(id));

  Future<void> setListVisibility({required String id, String? coupleId}) => _run(
    'change a list visibility',
    () => _dataSource.setListVisibility(id: id, coupleId: coupleId),
  );

  Future<void> addItem({
    required String id,
    required String listId,
    required String title,
    required int position,
  }) => _run(
    'add an item',
    () => _dataSource.addItem(id: id, listId: listId, title: title.trim(), position: position),
  );

  Future<void> setItemStatus({required String id, required String status}) =>
      _run('update an item', () => _dataSource.setItemStatus(id: id, status: status));

  Future<void> setItemPosition({required String id, required int position}) =>
      _run('reorder an item', () => _dataSource.setItemPosition(id: id, position: position));

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
