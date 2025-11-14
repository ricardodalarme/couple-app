import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/cubit/login_cubit.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

void main() {
  group('LoginCubit', () {
    late AuthenticationRepository authenticationRepository;
    late LoginCubit loginCubit;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      loginCubit = LoginCubit(authenticationRepository: authenticationRepository);
    });

    tearDown(() {
      loginCubit.close();
    });

    test('initial state is correct', () {
      expect(
        loginCubit.state,
        const LoginState(
          username: NonEmptyInput.pure(),
          password: NonEmptyInput.pure(),
          login: Initial(),
        ),
      );
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onUsernameChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onUsernameChanged('john'),
      expect: () => [const LoginState(username: NonEmptyInput.dirty('john'))],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onPasswordChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onPasswordChanged('password'),
      expect: () => [const LoginState(password: NonEmptyInput.dirty('password'))],
    );
  });
}
