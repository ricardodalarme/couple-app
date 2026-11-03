import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:logger/logger.dart';
import 'package:notification_service/notification_service.dart';

/// Registers the device with FCM and keeps its backend token in sync with auth.
class PushTokenRegistrar({
  required final NotificationService _notificationService,
  required final NotificationsRepository _notificationsRepository,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('PushTokenRegistrar');

  StreamSubscription<bool>? _authSubscription;
  StreamSubscription<String>? _registrationSubscription;
  String? _token;
  bool _initialized = false;

  /// Starts listening for auth and FCM registration changes.
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    _registrationSubscription = _notificationService.onRegistered.listen(_onRegistered);
    _authSubscription = _authenticationRepository.isAuthenticatedStream.listen(_onAuthChanged);

    if (_authenticationRepository.isAuthenticated) {
      await _register();
    }
  }

  Future<void> _register() async {
    try {
      await _notificationService.register();
    } catch (error, stackTrace) {
      _logger.error(
        'Failed to register for push notifications',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onRegistered(String token) async {
    _token = token;
    if (!_authenticationRepository.isAuthenticated) return;

    try {
      await _notificationsRepository.registerDeviceToken(token: token, platform: _platform);
    } catch (error, stackTrace) {
      _logger.error('Failed to persist the device token', error: error, stackTrace: stackTrace);
    }
  }

  Future<void> _onAuthChanged(bool isAuthenticated) async {
    if (isAuthenticated) {
      if (_token case final token?) {
        await _onRegistered(token);
      }
      await _register();
      return;
    }

    final token = _token;
    _token = null;
    if (token == null) return;

    try {
      await _notificationsRepository.unregisterDeviceToken(token: token);
      await _notificationService.unregister();
    } catch (error, stackTrace) {
      _logger.error('Failed to unregister the device token', error: error, stackTrace: stackTrace);
    }
  }

  String get _platform => switch (defaultTargetPlatform) {
    TargetPlatform.android => 'android',
    TargetPlatform.iOS => 'ios',
    _ => 'web',
  };

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    await _registrationSubscription?.cancel();
  }
}
