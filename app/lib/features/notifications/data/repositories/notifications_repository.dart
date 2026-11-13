import 'dart:async';

import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/local/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/local/notifications_local_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/remote/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/models/notification_preferences.dart';
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
  required final NotificationsLocalDataSource _localDataSource,
  required final NotificationService _notificationService,
  required final PermissionService _permissionService,
  required final DeviceInfoService _deviceInfoService,
  required final DeviceMarkerStore _markerStore,
}) {
  final Logger _logger = Logger('NotificationsRepository');
  String? _sessionToken;

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
    StreamSubscription<String>? registration;
    try {
      final installation = Completer<String>();
      registration = _notificationService.onRegistered.listen((id) {
        if (!installation.isCompleted) installation.complete(id);
      });
      await _notificationService.register();
      final installationId = await installation.future.timeout(const Duration(seconds: 10));
      final marker = DeviceMarkerStore.markerFor(installationId);
      final label = '${await _deviceLabel()}#$marker';
      final accepted = await _dataSource.registerDevice(
        token: installationId,
        platform: _platform,
        label: label,
      );
      if (!accepted) throw const LocalizedException(l10nKey: 'registerDevice');
      _sessionToken = installationId;
      await _markerStore.writeMarker(marker);
    } on Object catch (e, stack) {
      _logger.warning('Could not register this device for push', error: e, stackTrace: stack);
      throw const LocalizedException(l10nKey: 'registerDevice');
    } finally {
      await registration?.cancel();
    }
  }

  /// Removes this installation's notification row when the token is still known.
  Future<bool> unregisterCurrentDevice() async {
    final token = _sessionToken;
    if (token == null) return false;

    try {
      await _dataSource.unregisterDevice(token);
      _sessionToken = null;
      await _markerStore.clear();

      return true;
    } catch (e, stack) {
      _logger.warning('Could not unregister this device for push', error: e, stackTrace: stack);

      return false;
    }
  }

  /// Reads the notification choices kept on the server.
  Future<NotificationPreferences> getPreferences() async {
    try {
      final settings = await _dataSource.getSettings();

      return NotificationPreferences(
        isEnabled: settings.enabled,
        discreet: settings.discreet,
        mutedTypes: {...settings.mutedTypes.whereType<String>()},
        cardDay: settings.cardDay,
        cardHour: settings.cardHour,
      );
    } catch (e, stack) {
      _logger.error('Failed to load notification settings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves the notification choices on the server, where they apply to every push.
  Future<void> savePreferences(NotificationPreferences preferences) async {
    try {
      await _dataSource.updateSettings(
        enabled: preferences.isEnabled,
        discreet: preferences.discreet,
        mutedTypes: preferences.mutedTypes.toList(),
        cardDay: preferences.cardDay,
        cardHour: preferences.cardHour,
      );
    } catch (e, stack) {
      _logger.error('Failed to save notification settings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Whether the person hid the reminders-off notice on this device.
  bool get isOffBannerDismissed => _localDataSource.isOffBannerDismissed;

  Future<void> setOffBannerDismissed({required bool value}) =>
      _localDataSource.setOffBannerDismissed(value: value);

  Future<bool> openSettings() => _permissionService.openAppSettings();

  Future<String> _deviceLabel() async {
    try {
      return (await _deviceInfoService.getDeviceInfo()).deviceModel;
    } on Object {
      return _platform == 'ios' ? 'iPhone' : 'Android';
    }
  }

  String get _platform => defaultTargetPlatform == TargetPlatform.iOS ? 'ios' : 'android';

  NotificationAccess _toAccess(PermissionStatus status) =>
      status == PermissionStatus.granted || status == PermissionStatus.provisional
      ? NotificationAccess.granted
      : NotificationAccess.denied;
}
