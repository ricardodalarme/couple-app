import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_service/connectivity_service.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

class _MockSlipRepository() extends Mock implements SlipRepository;

class _MockSupportRepository() extends Mock implements SupportRepository;

class _MockReminderSyncService() extends Mock implements ReminderSyncService;

class _MockConnectivityService() extends Mock implements ConnectivityService;

class _MockNotificationsRepository() extends Mock implements NotificationsRepository;

class _MockDevicesRepository() extends Mock implements DevicesRepository;

void main() {
  late AuthenticationRepository authenticationRepository;
  late ProfileRepository profileRepository;
  late SettingsRepository settingsRepository;
  late SlipRepository slipRepository;
  late SupportRepository supportRepository;
  late ReminderSyncService reminderSyncService;
  late ConnectivityService connectivityService;
  late NotificationsRepository notificationsRepository;
  late DevicesRepository devicesRepository;

  AppCubit build() => AppCubit(
    authenticationRepository: authenticationRepository,
    profileRepository: profileRepository,
    settingsRepository: settingsRepository,
    slipRepository: slipRepository,
    supportRepository: supportRepository,
    reminderSyncService: reminderSyncService,
    connectivityService: connectivityService,
    notificationsRepository: notificationsRepository,
    devicesRepository: devicesRepository,
  );

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    profileRepository = _MockProfileRepository();
    settingsRepository = _MockSettingsRepository();
    slipRepository = _MockSlipRepository();
    supportRepository = _MockSupportRepository();
    reminderSyncService = _MockReminderSyncService();
    connectivityService = _MockConnectivityService();
    notificationsRepository = _MockNotificationsRepository();
    devicesRepository = _MockDevicesRepository();
    when(() => notificationsRepository.unregisterCurrentDevice()).thenAnswer((_) async => true);
    when(() => devicesRepository.revokeCurrentDevice()).thenAnswer((_) async {});
    when(() => reminderSyncService.sync()).thenAnswer((_) async {});
    when(() => slipRepository.flushPending()).thenAnswer((_) async {});
    when(() => supportRepository.flushPending(authorId: any(named: 'authorId')))
        .thenAnswer((_) async => 0);
    when(() => supportRepository.clearPending()).thenAnswer((_) async {});
    when(() => connectivityService.onStatusChange).thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticatedStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticated).thenReturn(true);
    when(() => authenticationRepository.currentUserId).thenReturn('fake');
    when(() => profileRepository.ensureProfile()).thenAnswer((_) async => const Profile.fake());
    when(() => profileRepository.getMySettings()).thenAnswer(
      (_) async => AccountSettings(theme: AppThemeVariant.blue, onboardedAt: DateTime(2026)),
    );
    when(() => settingsRepository.get()).thenReturn(const Settings.empty());
    when(() => settingsRepository.save(any())).thenAnswer((_) async {});
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'starts unauthenticated',
      build: build,
      verify: (cubit) => expect(cubit.state, AppState.unauthenticated),
    );

    blocTest<AppCubit, AppState>(
      'an onboarded person goes to authenticated and the theme is remembered',
      build: build,
      act: (cubit) => cubit.initialize(),
      expect: () => const [AppState.checking, AppState.authenticated],
      verify: (_) {
        verify(() => settingsRepository.save(any())).called(1);
        verify(() => supportRepository.flushPending(authorId: 'fake')).called(1);
      },
    );

    blocTest<AppCubit, AppState>(
      'a person without the profile step goes to onboarding',
      build: () {
        when(() => profileRepository.getMySettings())
            .thenAnswer((_) async => const AccountSettings(theme: AppThemeVariant.rose));
        return build();
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const [AppState.checking, AppState.onboarding],
    );

    blocTest<AppCubit, AppState>(
      'offline falls back to authenticated',
      build: () {
        when(() => profileRepository.ensureProfile()).thenAnswer((_) async => throw Exception());
        return build();
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const [AppState.checking, AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'a signed out stream goes to unauthenticated and clears the support queue',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(false));
        return build();
      },
      expect: () => const [AppState.unauthenticated],
      verify: (_) => verify(() => supportRepository.clearPending()).called(1),
    );

    test('a regained connection flushes the signed-in support queue', () async {
      final statuses = StreamController<bool>();
      when(() => connectivityService.onStatusChange).thenAnswer((_) => statuses.stream);
      addTearDown(statuses.close);
      final cubit = build();

      statuses.add(true);
      await pumpEventQueue();

      verify(() => supportRepository.flushPending(authorId: 'fake')).called(1);
      await cubit.close();
    });

    blocTest<AppCubit, AppState>(
      'completeOnboarding moves on to authenticated',
      build: build,
      act: (cubit) => cubit.completeOnboarding(),
      expect: () => const [AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'logout unregisters the device before signing out',
      build: () {
        when(() => authenticationRepository.logOut()).thenAnswer((_) async {});
        return build();
      },
      act: (cubit) => cubit.logout(),
      verify: (_) {
        verifyInOrder([
          () => notificationsRepository.unregisterCurrentDevice(),
          () => authenticationRepository.logOut(),
        ]);
        verifyNever(() => devicesRepository.revokeCurrentDevice());
      },
    );

    blocTest<AppCubit, AppState>(
      'logout removes the current row when the session token is gone',
      build: () {
        when(() => notificationsRepository.unregisterCurrentDevice())
            .thenAnswer((_) async => false);
        when(() => authenticationRepository.logOut()).thenAnswer((_) async {});
        return build();
      },
      act: (cubit) => cubit.logout(),
      verify: (_) {
        verify(() => devicesRepository.revokeCurrentDevice()).called(1);
        verify(() => authenticationRepository.logOut()).called(1);
      },
    );
  });
}
