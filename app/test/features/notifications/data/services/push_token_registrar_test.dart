import 'dart:async';

import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/services/push_token_registrar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notification_service/notification_service.dart';

class MockNotificationService() extends Mock implements NotificationService;

class MockNotificationsRepository() extends Mock implements NotificationsRepository;

class MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  setUpAll(() {
    registerFallbackValue('fallback');
  });

  group('PushTokenRegistrar', () {
    late NotificationService notificationService;
    late NotificationsRepository notificationsRepository;
    late AuthenticationRepository authenticationRepository;
    late PushTokenRegistrar registrar;

    setUp(() {
      notificationService = MockNotificationService();
      notificationsRepository = MockNotificationsRepository();
      authenticationRepository = MockAuthenticationRepository();
      registrar = PushTokenRegistrar(
        notificationService: notificationService,
        notificationsRepository: notificationsRepository,
        authenticationRepository: authenticationRepository,
      );
    });

    tearDown(() => registrar.dispose());

    test('registers the FID for an authenticated user', () async {
      when(() => authenticationRepository.isAuthenticated).thenReturn(true);
      when(() => authenticationRepository.isAuthenticatedStream)
          .thenAnswer((_) => const Stream.empty());
      when(() => notificationService.onRegistered).thenAnswer((_) => Stream.value('fid-123'));
      when(() => notificationService.register()).thenAnswer((_) async {});
      when(
        () => notificationsRepository.registerDeviceToken(
          token: 'fid-123',
          platform: any(named: 'platform'),
        ),
      ).thenAnswer((_) async {});

      await registrar.initialize();
      await Future<void>.delayed(Duration.zero);

      verify(
        () => notificationsRepository.registerDeviceToken(
          token: 'fid-123',
          platform: any(named: 'platform'),
        ),
      ).called(1);
    });
  });
}
