import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:notification_service/src/notification_exception.dart';
import 'package:notification_service/src/notification_message.dart';

/// Resolves after [duration] has elapsed.
typedef NotificationDelay = Future<void> Function(Duration duration);

/// [NotificationService] backed by Firebase Cloud Messaging.
///
/// Hides the FCM SDK from the app and rethrows every platform failure as a
/// [NotificationException] that preserves the original stack trace.
class NotificationService({
  final FirebaseMessaging? _messaging,
  final Stream<RemoteMessage>? _onMessage,
  final Stream<RemoteMessage>? _onMessageOpenedApp,
  final NotificationDelay? _delay,
  final Duration _apnsTokenTimeout = const Duration(seconds: 10),
  final Duration _apnsTokenPollInterval = const Duration(milliseconds: 500),
}) {
  FirebaseMessaging get _client => _messaging ?? FirebaseMessaging.instance;

  Stream<RemoteMessage> get _foregroundMessages => _onMessage ?? FirebaseMessaging.onMessage;

  Stream<RemoteMessage> get _openedMessages =>
      _onMessageOpenedApp ?? FirebaseMessaging.onMessageOpenedApp;

  NotificationDelay get _delayFor => _delay ?? Future<void>.delayed;

  bool get _usesApns => defaultTargetPlatform == .iOS || defaultTargetPlatform == .macOS;

  /// Registers the app instance with Firebase Cloud Messaging.
  ///
  /// On iOS and macOS this waits briefly for the APNs token and returns without
  /// registering if it does not arrive, avoiding `apns-token-not-set`.
  Future<void> register() async {
    try {
      if (_usesApns && !await _waitForApnsToken()) return;
      await _client.register();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(NotificationException(error), stackTrace);
    }
  }

  /// Emits the Firebase Installation ID once registration completes and
  /// whenever the platform rotates it.
  Stream<String> get onRegistered => _client.onRegistered;

  /// Unregisters the app instance from Firebase Cloud Messaging.
  Future<void> unregister() async {
    try {
      await _client.unregister();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(NotificationException(error), stackTrace);
    }
  }

  /// Notifications received while the app is in the foreground.
  Stream<NotificationMessage> get onMessage => _foregroundMessages.map(_toNotificationMessage);

  /// Notifications tapped by the user while the app was in the background.
  Stream<NotificationMessage> get onMessageOpenedApp => _openedMessages.map(_toNotificationMessage);

  /// Message that launched the app from a terminated state, or null.
  Future<NotificationMessage?> getInitialMessage() async {
    try {
      final message = await _client.getInitialMessage();
      return message == null ? null : _toNotificationMessage(message);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(NotificationException(error), stackTrace);
    }
  }

  Future<bool> _waitForApnsToken() async {
    final deadline = DateTime.now().add(_apnsTokenTimeout);
    while (true) {
      final token = await _client.getAPNSToken();
      if (token != null && token.isNotEmpty) return true;
      if (!DateTime.now().isBefore(deadline)) return false;
      await _delayFor(_apnsTokenPollInterval);
    }
  }

  NotificationMessage _toNotificationMessage(RemoteMessage message) => NotificationMessage(
    id: message.messageId,
    title: message.notification?.title,
    body: message.notification?.body,
    data: _stringifyData(message.data),
  );

  Map<String, String> _stringifyData(Map<String, dynamic> data) {
    final result = <String, String>{};
    for (final entry in data.entries) {
      final value = entry.value;
      if (value != null) result[entry.key] = value.toString();
    }
    return result;
  }
}
