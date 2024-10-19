import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('LoginBloc', () {
    late AuthenticationRepository authenticationRepository;
    late LoginBloc loginBloc;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      loginBloc = LoginBloc(authenticationRepository: authenticationRepository);
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state is correct', () {
      expect(
        loginBloc.state,
        const LoginState(
          username: NonEmptyInput.pure(),
          password: NonEmptyInput.pure(),
          status: FormzSubmissionStatus.initial,
        ),
      );
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginState] when [LoginUsernameChanged] is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginUsernameChanged('john')),
      expect: () => [const LoginState(username: NonEmptyInput.dirty('john'))],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginState] when [LoginPasswordChanged] is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginPasswordChanged('password')),
      expect: () =>
          [const LoginState(password: NonEmptyInput.dirty('password'))],
    );
  });
}
