import 'dart:async';

import 'package:flutter_bloc_starter/features/together/data/data_sources/together_data_source.dart';
import 'package:flutter_bloc_starter/features/together/data/models/logistic_item.dart';
import 'package:logger/logger.dart';

class TogetherRepository({required final TogetherDataSource _dataSource}) {
  final Logger _logger = Logger('TogetherRepository');
  final StreamController<void> _changes = StreamController<void>.broadcast();

  /// Emits whenever a shared item is changed on this device, so lists can read again.
  Stream<void> get onChanged => _changes.stream;

  Future<List<LogisticItem>> getLogisticItems() async {
    try {
      return [
        for (final node in await _dataSource.getLogisticItems())
          LogisticItem(
            id: node.id,
            title: node.title,
            assigneeId: node.assigneeId,
            isDone: node.doneAt != null,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read logistics', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Adds an item shared with the partner when there is one; the client [id] makes retries safe.
  Future<void> addLogisticItem({
    required String id,
    required String title,
    String? assigneeId,
  }) async {
    try {
      final coupleId = await _dataSource.getCoupleId();
      await _dataSource.addLogisticItem(
        id: id,
        title: title.trim(),
        assigneeId: assigneeId,
        coupleId: coupleId,
      );
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to add a logistic item', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setLogisticItemDone({required String id, required bool isDone, DateTime? now}) =>
      _run(
        'update a logistic item',
        () => _dataSource.setLogisticItemDone(
          id: id,
          doneAt: isDone ? (now ?? DateTime.now()) : null,
        ),
      );

  Future<void> setLogisticItemAssignee({required String id, String? assigneeId}) => _run(
    'assign a logistic item',
    () => _dataSource.setLogisticItemAssignee(id: id, assigneeId: assigneeId),
  );

  Future<void> deleteLogisticItem(String id) =>
      _run('delete a logistic item', () => _dataSource.deleteLogisticItem(id));

  Future<void> _run(String what, Future<void> Function() action) async {
    try {
      await action();
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
