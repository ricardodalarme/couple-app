part of 'notifications_off_cubit.dart';

final class const NotificationsOffState({final bool isOff = false, final bool isDismissed = false})
    with Equatable {
  /// Whether the notice should show.
  bool get isVisible => isOff && !isDismissed;

  @override
  List<Object?> get props => [isOff, isDismissed];
}
