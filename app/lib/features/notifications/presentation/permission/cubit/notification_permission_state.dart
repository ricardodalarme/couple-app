part of 'notification_permission_cubit.dart';

final class const NotificationPermissionState({
  final Resource<NotificationAccess> requestAction = const Initial(),
}) with Equatable {
  @override
  List<Object?> get props => [requestAction];
}
