import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/app_notification.dart';

final class const NotificationInbox({
  required final List<AppNotification> items,
  required final bool hasMore,
}) with Equatable {
  static final NotificationInbox fake = NotificationInbox(
    items: List.filled(4, AppNotification.fake),
    hasMore: false,
  );

  bool get isEmpty => items.isEmpty;

  int get unreadCount => items.where((item) => item.isUnread).length;

  bool get hasUnread => items.any((item) => item.isUnread);

  NotificationInbox replacedRead(Set<String> ids, DateTime readAt) => NotificationInbox(
    items: [
      for (final item in items)
        if (ids.contains(item.id) && item.isUnread) item.markedRead(readAt) else item,
    ],
    hasMore: hasMore,
  );

  @override
  List<Object?> get props => [items, hasMore];
}
