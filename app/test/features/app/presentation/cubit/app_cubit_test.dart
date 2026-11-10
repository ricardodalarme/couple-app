import 'package:bloc_test/bloc_test.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

class _MockSettingsRepository() extends Mock implements SettingsRepository;

void main() {
  late AuthenticationRepository authenticationRepository;
  late ProfileRepository profileRepository;
  late SettingsRepository settingsRepository;

  AppCubit build() => AppCubit(
    authenticationRepository: authenticationRepository,
    profileRepository: profileRepository,
    settingsRepository: settingsRepository,
  );

  setUpAll(() => registerFallbackValue(const Settings.empty()));

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    profileRepository = _MockProfileRepository();
    settingsRepository = _MockSettingsRepository();
    when(() => authenticationRepository.isAuthenticatedStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticated).thenReturn(true);
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
      verify: (_) => verify(() => settingsRepository.save(any())).called(1),
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
      'a signed out stream goes to unauthenticated',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(false));
        return build();
      },
      expect: () => const [AppState.unauthenticated],
    );

    blocTest<AppCubit, AppState>(
      'completeOnboarding moves on to authenticated',
      build: build,
      act: (cubit) => cubit.completeOnboarding(),
      expect: () => const [AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'logout signs the repository out',
      build: () {
        when(() => authenticationRepository.logOut()).thenAnswer((_) async {});
        return build();
      },
      act: (cubit) => cubit.logout(),
      verify: (_) => verify(() => authenticationRepository.logOut()).called(1),
    );
  });
}
