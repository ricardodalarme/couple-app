import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

/// Handles notifications that arrive while the app is backgrounded or
/// terminated.
///
/// Firebase requires this to be a top-level function. Register it before
/// `runApp` with [registerNotificationBackgroundHandler].
///
/// It runs in a separate isolate without access to dependency injection, so it
/// only logs the delivery for now.
@pragma('vm:entry-point')
Future<void> notificationBackgroundHandler(RemoteMessage message) async {
  log('Notification received in background: ${message.messageId}', name: 'notification_service');
}

/// Registers [notificationBackgroundHandler] as the platform background
/// message handler.
///
/// Must run before `runApp` so a notification that launches a terminated app is
/// not dropped.
void registerNotificationBackgroundHandler() {
  FirebaseMessaging.onBackgroundMessage(notificationBackgroundHandler);
}
