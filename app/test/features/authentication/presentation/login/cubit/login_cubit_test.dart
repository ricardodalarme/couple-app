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
      expect(loginCubit.state, const LoginState());
    });

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onEmailChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const LoginState(email: FormInput('john@example.com'))],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginState] when onPasswordChanged is called',
      build: () => loginCubit,
      act: (cubit) => cubit.onPasswordChanged('password'),
      expect: () => [const LoginState(password: FormInput('password'))],
    );

    blocTest<LoginCubit, LoginState>(
      'clears a seeded email error when onEmailChanged is called',
      build: () => loginCubit,
      seed: () => const LoginState(email: FormInput('', error: EmailValidationError.invalid)),
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const LoginState(email: FormInput('john@example.com'))],
    );

    blocTest<LoginCubit, LoginState>(
      'emits validation errors and does not log in when the form is empty',
      build: () => loginCubit,
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const LoginState(
          email: FormInput('', error: EmailValidationError.invalid),
          password: FormInput('', error: NonEmptyValidationError.empty),
        ),
      ],
      verify: (_) {
        verifyNever(
          () => authenticationRepository.logInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        );
      },
    );

    blocTest<LoginCubit, LoginState>(
      'logs in and emits [Loading, Success] when the form is valid',
      build: () {
        when(
          () => authenticationRepository.logInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async {});

        return loginCubit;
      },
      seed: () =>
          const LoginState(email: FormInput('john@example.com'), password: FormInput('password')),
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const LoginState(
          email: FormInput('john@example.com'),
          password: FormInput('password'),
          login: Loading(),
        ),
        const LoginState(
          email: FormInput('john@example.com'),
          password: FormInput('password'),
          login: Success(null),
        ),
      ],
      verify: (_) {
        verify(
          () => authenticationRepository.logInWithEmailAndPassword(
            email: 'john@example.com',
            password: 'password',
          ),
        ).called(1);
      },
    );
  });
}
