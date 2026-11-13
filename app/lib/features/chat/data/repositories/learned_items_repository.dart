import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/learned_items_data_source.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:logger/logger.dart';

class LearnedItemsRepository({required final LearnedItemsDataSource _dataSource}) {
  final Logger _logger = Logger('LearnedItemsRepository');

  Future<List<LearnedItem>> getItems() async {
    try {
      return [
        for (final node in await _dataSource.getItems())
          LearnedItem(
            id: node.id,
            target: LearnedTarget.fromWire(node.target),
            text: node.text,
            excerpt: node.excerpt,
            status: LearnedStatus.fromWire(node.status),
            createdAt: node.createdAt,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read learnings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves a new pending learning; nothing is sent to the partner.
  Future<void> add({required LearnedTarget target, required String text, String? excerpt}) async {
    try {
      final trimmed = text.trim();
      final trimmedExcerpt = excerpt?.trim();
      await _dataSource.add(
        target: target.wire,
        text: trimmed,
        excerpt: trimmedExcerpt == null
            ? null
            : trimmedExcerpt.length > learnedExcerptMaxLength
            ? trimmedExcerpt.substring(0, learnedExcerptMaxLength)
            : trimmedExcerpt,
      );
    } catch (e, stack) {
      _logger.error('Failed to save a learning', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> updateText(String id, String text) async {
    try {
      await _dataSource.updateText(id: id, text: text.trim());
    } catch (e, stack) {
      _logger.error('Failed to edit a learning', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setStatus(String id, LearnedStatus status) async {
    try {
      await _dataSource.setStatus(id: id, status: status.wire);
    } catch (e, stack) {
      _logger.error('Failed to change a learning status', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dataSource.delete(id);
    } catch (e, stack) {
      _logger.error('Failed to delete a learning', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
