import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_inbox.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final readAt = DateTime.utc(2024, 1, 2);

  AppNotification notification(String id, {DateTime? readAt}) => AppNotification(
    id: id,
    kind: 'system',
    title: 'title',
    body: null,
    data: const {},
    createdAt: DateTime.utc(2024),
    readAt: readAt,
  );

  group('NotificationsState', () {
    test('returns same object when no properties are passed', () {
      expect(const NotificationsState().copyWith(), const NotificationsState());
    });

    test('returns object with updated notifications when notifications is passed', () {
      final inbox = NotificationInbox(items: [notification('1')], hasMore: false);

      expect(
        const NotificationsState().copyWith(notifications: Success(inbox)),
        NotificationsState(notifications: Success(inbox)),
      );
    });

    test('returns object with updated actions when actions are passed', () {
      expect(
        const NotificationsState().copyWith(
          markReadAction: const Loading(),
          markAllReadAction: const Success<void>(null),
        ),
        const NotificationsState(markReadAction: Loading(), markAllReadAction: Success(null)),
      );
    });

    test('unreadCount and hasUnread report the inbox unread items', () {
      final inbox = NotificationInbox(
        items: [
          notification('1'),
          notification('2', readAt: readAt),
          notification('3'),
        ],
        hasMore: false,
      );
      final state = NotificationsState(notifications: Success(inbox));

      expect(state.unreadCount, 2);
      expect(state.hasUnread, isTrue);
    });

    test('unreadCount and hasUnread are empty while loading or failing', () {
      expect(const NotificationsState().unreadCount, 0);
      expect(const NotificationsState().hasUnread, isFalse);
      expect(const NotificationsState(notifications: Failure(UnknownException())).unreadCount, 0);
      expect(
        const NotificationsState(notifications: Failure(UnknownException())).hasUnread,
        isFalse,
      );
    });
  });

  group('NotificationInbox', () {
    test('replacedRead only marks the matching unread items', () {
      final inbox = NotificationInbox(
        items: [
          notification('1'),
          notification('2', readAt: readAt),
          notification('3'),
        ],
        hasMore: true,
      );

      final updated = inbox.replacedRead({'2', '3'}, DateTime.utc(2024, 5));

      expect(updated.items[0].isUnread, isTrue);
      expect(updated.items[1].readAt, readAt);
      expect(updated.items[2].readAt, DateTime.utc(2024, 5));
      expect(updated.hasMore, isTrue);
    });

    test('isEmpty reports whether the inbox holds items', () {
      expect(const NotificationInbox(items: [], hasMore: false).isEmpty, isTrue);
      expect(NotificationInbox(items: [notification('1')], hasMore: false).isEmpty, isFalse);
    });
  });
}
