import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  group('SignupCubit', () {
    late AuthenticationRepository authenticationRepository;
    late SignupCubit signupCubit;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();

      signupCubit = SignupCubit(authenticationRepository: authenticationRepository);
    });

    tearDown(() {
      signupCubit.close();
    });

    test('initial state is correct', () {
      expect(signupCubit.state, const SignupState());
    });

    blocTest<SignupCubit, SignupState>(
      'emits [SignupState] when onEmailChanged is called',
      build: () => signupCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const SignupState(email: FormInput('john@example.com'))],
    );

    blocTest<SignupCubit, SignupState>(
      'emits [SignupState] when onConfirmPasswordChanged is called',
      build: () => signupCubit,
      act: (cubit) => cubit.onConfirmPasswordChanged('password'),
      expect: () => [const SignupState(confirmPassword: FormInput('password'))],
    );

    blocTest<SignupCubit, SignupState>(
      'clears a seeded confirm password error and preserves its value when onPasswordChanged is called',
      build: () => signupCubit,
      seed: () => const SignupState(
        password: FormInput('password'),
        confirmPassword: FormInput('confirmation', error: ConfirmValueValidationError.invalid),
      ),
      act: (cubit) => cubit.onPasswordChanged('newPassword1'),
      expect: () => [
        const SignupState(
          password: FormInput('newPassword1'),
          confirmPassword: FormInput('confirmation'),
        ),
      ],
    );

    blocTest<SignupCubit, SignupState>(
      'emits validation errors and does not sign up when the form is empty',
      build: () => signupCubit,
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const SignupState(
          email: FormInput('', error: EmailValidationError.invalid),
          password: FormInput('', error: PasswordValidationError.weak),
        ),
      ],
      verify: (_) {
        verifyNever(
          () => authenticationRepository.signup(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        );
      },
    );
  });
}
