part of 'notifications_cubit.dart';

final class const NotificationsState({
  final Resource<NotificationInbox> notifications = const Loading(),
  final Resource<void> markReadAction = const Initial(),
  final Resource<void> markAllReadAction = const Initial(),
}) with Equatable {
  NotificationsState copyWith({
    Resource<NotificationInbox>? notifications,
    Resource<void>? markReadAction,
    Resource<void>? markAllReadAction,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      markReadAction: markReadAction ?? this.markReadAction,
      markAllReadAction: markAllReadAction ?? this.markAllReadAction,
    );
  }

  int get unreadCount {
    final inbox = notifications;

    return inbox is Success<NotificationInbox> ? inbox.value.unreadCount : 0;
  }

  bool get hasUnread {
    final inbox = notifications;

    return inbox is Success<NotificationInbox> && inbox.value.hasUnread;
  }

  @override
  List<Object?> get props => [notifications, markReadAction, markAllReadAction];
}
