import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

class _MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late SettingsRepository settingsRepository;

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    settingsRepository = _MockSettingsRepository();

    when(
      () => authenticationRepository.isAuthenticatedStream,
    ).thenAnswer((_) => Stream.value(false));
    when(() => authenticationRepository.isAuthenticated).thenReturn(false);
    when(
      () => settingsRepository.get(),
    ).thenReturn(const Settings(hasOnboarded: true, useBiometrics: false));
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'starts with [unauthenticated] state',
      build: () => AppCubit(
        authenticationRepository: authenticationRepository,
        settingsRepository: settingsRepository,
      ),
      verify: (cubit) {
        expect(cubit.state, AppState.unauthenticated);
      },
    );

    blocTest<AppCubit, AppState>(
      'emits [authenticated] when stream emits true',
      build: () {
        final repo = _MockAuthenticationRepository();

        when(() => repo.isAuthenticated).thenReturn(false);
        when(() => repo.isAuthenticatedStream).thenAnswer((_) => Stream.value(true));

        return AppCubit(authenticationRepository: repo, settingsRepository: settingsRepository);
      },
      expect: () => const <AppState>[AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'emits [unauthenticated] when stream emits false',
      build: () {
        final repo = _MockAuthenticationRepository();

        when(() => repo.isAuthenticated).thenReturn(true);
        when(() => repo.isAuthenticatedStream).thenAnswer((_) => Stream.value(false));

        return AppCubit(authenticationRepository: repo, settingsRepository: settingsRepository);
      },
      expect: () => const <AppState>[AppState.unauthenticated],
    );

    blocTest<AppCubit, AppState>(
      'emits [onboarding] when initialize and user not onboarded',
      build: () {
        final repo = _MockAuthenticationRepository();
        final settingsRepo = _MockSettingsRepository();

        when(() => repo.isAuthenticated).thenReturn(false);
        when(() => repo.isAuthenticatedStream).thenAnswer((_) => const Stream<bool>.empty());
        when(
          settingsRepo.get,
        ).thenReturn(const Settings(hasOnboarded: false, useBiometrics: false));

        return AppCubit(authenticationRepository: repo, settingsRepository: settingsRepo);
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const <AppState>[AppState.onboarding],
    );

    blocTest<AppCubit, AppState>(
      'emits [authenticated] when initialize and onboarded + authenticated',
      build: () {
        final repo = _MockAuthenticationRepository();
        final settingsRepo = _MockSettingsRepository();

        when(() => repo.isAuthenticated).thenReturn(true);
        when(() => repo.isAuthenticatedStream).thenAnswer((_) => const Stream<bool>.empty());
        when(settingsRepo.get).thenReturn(const Settings(hasOnboarded: true, useBiometrics: false));

        return AppCubit(authenticationRepository: repo, settingsRepository: settingsRepo);
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const <AppState>[AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'calls logOut on logout',
      build: () {
        when(() => authenticationRepository.isAuthenticated).thenReturn(false);
        when(
          () => authenticationRepository.isAuthenticatedStream,
        ).thenAnswer((_) => Stream.value(false));
        when(authenticationRepository.logOut).thenAnswer((_) async {});

        return AppCubit(
          authenticationRepository: authenticationRepository,
          settingsRepository: settingsRepository,
        );
      },
      act: (cubit) => cubit.logout(),
      verify: (_) => verify(() => authenticationRepository.logOut()).called(1),
    );
  });
}
