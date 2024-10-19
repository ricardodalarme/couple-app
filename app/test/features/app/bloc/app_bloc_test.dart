import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/app/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late AppBloc bloc;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    when(() => authenticationRepository.isAuthenticated)
        .thenAnswer((_) => Stream.value(false));
    bloc = AppBloc(authenticationRepository: authenticationRepository);
  });

  group('AppBloc', () {
    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] initially',
      build: () => bloc,
      verify: (bloc) {
        expect(bloc.state, const AppState.unauthenticated());
      },
    );

    blocTest<AppBloc, AppState>(
      'emits [authenticated] when AppStatusChanged with true is added',
      build: () => bloc,
      act: (bloc) => bloc.add(const AppStatusChanged(true)),
      expect: () => const <AppState>[AppState.authenticated()],
    );

    blocTest<AppBloc, AppState>(
      'emits [unauthenticated] when AppStatusChanged with false is added',
      build: () => AppBloc(authenticationRepository: authenticationRepository),
      act: (bloc) => bloc.add(const AppStatusChanged(false)),
      expect: () => const <AppState>[AppState.unauthenticated()],
    );

    blocTest<AppBloc, AppState>(
      'calls logOut on AppLogoutRequested',
      build: () => AppBloc(authenticationRepository: authenticationRepository),
      setUp: () {
        when(() => authenticationRepository.logOut()).thenAnswer((_) async {});
      },
      act: (bloc) => bloc.add(const AppLogoutRequested()),
      verify: (_) {
        verify(authenticationRepository.logOut).called(1);
      },
    );
  });
}
