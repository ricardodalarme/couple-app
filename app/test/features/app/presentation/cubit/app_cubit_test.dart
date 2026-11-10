import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late AuthenticationRepository authenticationRepository;
  late ProfileRepository profileRepository;

  AppCubit build() => AppCubit(
    authenticationRepository: authenticationRepository,
    profileRepository: profileRepository,
  );

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    profileRepository = _MockProfileRepository();
    when(() => authenticationRepository.isAuthenticatedStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticated).thenReturn(false);
    when(() => profileRepository.ensureProfile()).thenAnswer((_) async => const Profile.fake());
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'starts unauthenticated',
      build: build,
      verify: (cubit) => expect(cubit.state, AppState.unauthenticated),
    );

    blocTest<AppCubit, AppState>(
      'emits authenticated and ensures the profile when the session stream reports true',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(true));
        return build();
      },
      expect: () => const [AppState.authenticated],
      verify: (_) => verify(() => profileRepository.ensureProfile()).called(1),
    );

    blocTest<AppCubit, AppState>(
      'emits unauthenticated without touching the profile when the stream reports false',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(false));
        return build();
      },
      expect: () => const [AppState.unauthenticated],
      verify: (_) => verifyNever(() => profileRepository.ensureProfile()),
    );

    blocTest<AppCubit, AppState>(
      'initialize restores an existing session',
      build: () {
        when(() => authenticationRepository.isAuthenticated).thenReturn(true);
        return build();
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const [AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'a failing profile call does not change the session state',
      build: () {
        when(() => authenticationRepository.isAuthenticated).thenReturn(true);
        when(() => profileRepository.ensureProfile()).thenAnswer((_) async => throw Exception());
        return build();
      },
      act: (cubit) => cubit.initialize(),
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
