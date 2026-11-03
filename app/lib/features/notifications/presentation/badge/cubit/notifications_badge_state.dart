part of 'notifications_badge_cubit.dart';

final class const NotificationsBadgeState({final Resource<bool> hasUnread = const Loading()})
    with Equatable {
  NotificationsBadgeState copyWith({Resource<bool>? hasUnread}) {
    return NotificationsBadgeState(hasUnread: hasUnread ?? this.hasUnread);
  }

  bool get unread {
    final hasUnread = this.hasUnread;

    return hasUnread is Success<bool> && hasUnread.value;
  }

  @override
  List<Object?> get props => [hasUnread];
}
