import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

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
          email: EmailInput.pure(),
          password: NonEmptyInput.pure(),
          login: Initial(),
        ),
      );
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onEmailChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const LoginState(email: EmailInput.dirty('john@example.com'))],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onPasswordChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onPasswordChanged('password'),
      expect: () => [const LoginState(password: NonEmptyInput.dirty('password'))],
    );
  });
}
