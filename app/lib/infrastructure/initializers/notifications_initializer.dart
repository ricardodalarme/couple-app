import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/infrastructure/initializers/firebase_initializer.dart';
import 'package:logger/logger.dart';
import 'package:notification_service/notification_service.dart';

@pragma('vm:entry-point')
Future<void> notificationBackgroundHandler(Object message) async {
  final notification = NotificationMessage.fromRemoteMessage(message);

  log('Notification received in background: ${notification.id}', name: 'notification');
}

final class NotificationsInitializer() extends Initializer {
  static final Logger _logger = Logger('NotificationsInitializer');

  @override
  List<Type> get dependencies => const [FirebaseInitializer];

  @override
  void initialize() {
    _logger.info('Registering notification background handler');

    AppInjector.instance.get<NotificationService>().registerBackgroundMessageHandler(
      notificationBackgroundHandler,
    );
  }
}
