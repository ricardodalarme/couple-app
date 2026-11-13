import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/account_data_source.dart';
import 'package:flutter_bloc_starter/features/account/data/models/deletion_request.dart';
import 'package:logger/logger.dart';

/// Requests and cancels the 14-day account deletion.
class AccountRepository({required final AccountDataSource _dataSource}) {
  final Logger _logger = Logger('AccountRepository');

  Future<DeletionRequest?> getDeletion() async {
    try {
      final node = await _dataSource.getDeletion();
      if (node == null) return null;

      return DeletionRequest(requestedAt: node.requestedAt, purgeAfter: node.purgeAfter);
    } catch (e, stack) {
      _logger.error('Failed to read the deletion request', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<DeletionRequest> requestDeletion() async {
    try {
      final row = await _dataSource.requestDeletion();

      return DeletionRequest(requestedAt: row.requestedAt, purgeAfter: row.purgeAfter);
    } catch (e, stack) {
      _logger.error('Failed to request account deletion', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> cancelDeletion() async {
    try {
      await _dataSource.cancelDeletion();
    } catch (e, stack) {
      _logger.error('Failed to cancel account deletion', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
