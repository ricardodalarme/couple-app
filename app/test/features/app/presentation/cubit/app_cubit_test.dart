import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/app/presentation/cubit/app_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late AppCubit cubit;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    when(() => authenticationRepository.isAuthenticated).thenAnswer((_) => Stream.value(false));
    cubit = AppCubit(authenticationRepository: authenticationRepository);
  });

  group('AppCubit', () {
    blocTest<AppCubit, AppState>(
      'emits [unauthenticated] initially',
      build: () => cubit,
      verify: (cubit) {
        expect(cubit.state, const AppState.unauthenticated());
      },
    );

    blocTest<AppCubit, AppState>(
      'emits [authenticated] when repository emits true',
      build: () {
        final repo = MockAuthenticationRepository();
        when(() => repo.isAuthenticated).thenAnswer((_) => Stream.value(true));
        return AppCubit(authenticationRepository: repo);
      },
      expect: () => const <AppState>[AppState.authenticated()],
    );

    blocTest<AppCubit, AppState>(
      'emits [unauthenticated] when repository emits false',
      build: () {
        final repo = MockAuthenticationRepository();
        when(() => repo.isAuthenticated).thenAnswer((_) => Stream.value(false));
        return AppCubit(authenticationRepository: repo);
      },
      expect: () => const <AppState>[AppState.unauthenticated()],
    );

    blocTest<AppCubit, AppState>(
      'calls logOut on logout',
      build: () {
        final repo = MockAuthenticationRepository();
        when(() => repo.isAuthenticated).thenAnswer((_) => Stream.value(false));
        when(repo.logOut).thenAnswer((_) async {});
        return AppCubit(authenticationRepository: repo);
      },
      act: (cubit) => cubit.logout(),
    );
  });
}
