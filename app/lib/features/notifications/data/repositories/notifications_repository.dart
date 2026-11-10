import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:logger/logger.dart';
import 'package:notification_service/notification_service.dart';
import 'package:permission_service/permission_service.dart';

/// Whether the device may show notifications.
enum NotificationAccess() {
  granted,
  denied,
}

class NotificationsRepository({
  required final NotificationsDataSource _dataSource,
  required final NotificationService _notificationService,
  required final PermissionService _permissionService,
}) {
  final Logger _logger = Logger('NotificationsRepository');

  /// Reads the current access without asking.
  Future<NotificationAccess> currentAccess() async {
    final status = await _permissionService.check(Permission.notification);

    return _toAccess(status);
  }

  /// Shows the system prompt and, when allowed, registers this device.
  Future<NotificationAccess> requestAccess() async {
    final status = await _permissionService.request(Permission.notification);
    final access = _toAccess(status);
    if (access == NotificationAccess.granted) await registerDevice();

    return access;
  }

  /// Registers the push token with the backend; a failure is retried at the next launch.
  Future<void> registerDevice() async {
    try {
      await _notificationService.register();
      final token = await _notificationService.onRegistered.first.timeout(
        const Duration(seconds: 10),
      );
      await _dataSource.registerDevice(token: token, platform: _platform);
    } catch (e, stack) {
      _logger.warning('Could not register this device for push', error: e, stackTrace: stack);
    }
  }

  Future<bool> openSettings() => _permissionService.openAppSettings();

  String get _platform => defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android';

  NotificationAccess _toAccess(PermissionStatus status) =>
      status == PermissionStatus.granted || status == PermissionStatus.provisional
      ? NotificationAccess.granted
      : NotificationAccess.denied;
}
