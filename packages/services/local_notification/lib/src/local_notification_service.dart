import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:local_notification_service/src/local_notification_exception.dart';
import 'package:local_notification_service/src/local_notification_request.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

const String _androidIcon = '@mipmap/ic_launcher';

/// Schedules notifications on the device so reminders work without a connection.
///
/// Scheduling is inexact on Android, which needs no extra permission and is close enough for a
/// gentle reminder.
class LocalNotificationService({final FlutterLocalNotificationsPlugin? _plugin}) {
  FlutterLocalNotificationsPlugin get _client => _plugin ?? _defaultPlugin;

  static final FlutterLocalNotificationsPlugin _defaultPlugin = FlutterLocalNotificationsPlugin();

  bool _isReady = false;

  /// Prepares the plugin and the device time zone; safe to call more than once.
  ///
  /// Does not ask for permission: the permission flow owns that.
  Future<void> initialize() async {
    if (_isReady) return;

    try {
      tz_data.initializeTimeZones();
      await _useDeviceTimeZone();
      await _client.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings(_androidIcon),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
      );
      _isReady = true;
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(LocalNotificationException(error), stackTrace);
    }
  }

  /// Replaces every pending notification with [requests].
  ///
  /// Asking again with the same ids replaces them, so repeating a plan never duplicates.
  Future<void> replaceAll(List<LocalNotificationRequest> requests) async {
    await initialize();
    try {
      await _client.cancelAllPendingNotifications();
      for (final request in requests) {
        await _client.zonedSchedule(
          id: request.id,
          title: request.title,
          body: request.body,
          scheduledDate: tz.TZDateTime.from(request.at, tz.local),
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails('reminders', 'Reminders'),
            iOS: DarwinNotificationDetails(),
          ),
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        );
      }
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(LocalNotificationException(error), stackTrace);
    }
  }

  Future<void> cancelAll() async {
    await initialize();
    try {
      await _client.cancelAllPendingNotifications();
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(LocalNotificationException(error), stackTrace);
    }
  }

  Future<void> _useDeviceTimeZone() async {
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } on Object {
      // Falls back to UTC, which only shifts reminders; the next plan corrects it.
    }
  }
}
