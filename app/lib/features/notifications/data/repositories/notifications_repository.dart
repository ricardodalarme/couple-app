import 'package:flutter_bloc_starter/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/mappers/notification_mapper.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:logger/logger.dart';

class NotificationsRepository({required final NotificationsDataSource _notificationsDataSource}) {
  final Logger _logger = Logger('NotificationsRepository');

  static const int pageSize = 50;

  Future<NotificationInbox> getNotifications() async {
    _logger.info('Fetching notifications');

    try {
      final result = await _notificationsDataSource.getNotifications(first: pageSize);

      final items = result.edges.map((edge) => edge.node.toModel()).toList();

      _logger.trace('Fetched ${items.length} notifications');
      return NotificationInbox(items: items, hasMore: result.pageInfo.hasNextPage);
    } catch (e, stack) {
      _logger.error('Failed to fetch notifications', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<bool> hasUnreadNotifications() async {
    _logger.info('Checking for unread notifications');

    try {
      final result = await _notificationsDataSource.getUnreadNotifications();

      return result.edges.isNotEmpty;
    } catch (e, stack) {
      _logger.error('Failed to check unread notifications', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> markRead(List<String> ids) async {
    if (ids.isEmpty) return;

    _logger.info('Marking notifications as read ids=$ids');

    try {
      await _notificationsDataSource.markRead(ids: ids);
    } catch (e, stack) {
      _logger.error('Failed to mark notifications as read', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> markAllRead() async {
    _logger.info('Marking all notifications as read');

    try {
      await _notificationsDataSource.markAllRead();
    } catch (e, stack) {
      _logger.error('Failed to mark all notifications as read', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
