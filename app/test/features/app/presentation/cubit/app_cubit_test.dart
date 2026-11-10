import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = _MockAuthenticationRepository();
    when(() => authenticationRepository.isAuthenticatedStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => authenticationRepository.isAuthenticated).thenReturn(false);
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'starts unauthenticated',
      build: () => AppCubit(authenticationRepository: authenticationRepository),
      verify: (cubit) => expect(cubit.state, AppState.unauthenticated),
    );

    blocTest<AppCubit, AppState>(
      'emits authenticated when the session stream reports true',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(true));
        return AppCubit(authenticationRepository: authenticationRepository);
      },
      expect: () => const [AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'emits unauthenticated when the session stream reports false',
      build: () {
        when(() => authenticationRepository.isAuthenticatedStream)
            .thenAnswer((_) => Stream.value(false));
        return AppCubit(authenticationRepository: authenticationRepository);
      },
      expect: () => const [AppState.unauthenticated],
    );

    blocTest<AppCubit, AppState>(
      'initialize restores an existing session',
      build: () {
        when(() => authenticationRepository.isAuthenticated).thenReturn(true);
        return AppCubit(authenticationRepository: authenticationRepository);
      },
      act: (cubit) => cubit.initialize(),
      expect: () => const [AppState.authenticated],
    );

    blocTest<AppCubit, AppState>(
      'logout signs the repository out',
      build: () {
        when(() => authenticationRepository.logOut()).thenAnswer((_) async {});
        return AppCubit(authenticationRepository: authenticationRepository);
      },
      act: (cubit) => cubit.logout(),
      verify: (_) => verify(() => authenticationRepository.logOut()).called(1),
    );
  });
}
