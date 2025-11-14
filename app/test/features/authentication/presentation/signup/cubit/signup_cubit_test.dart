import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/cubit/signup_cubit.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {}

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
      expect(
        signupCubit.state,
        const SignupState(
          email: EmailInput.pure(),
          password: PasswordInput.pure(),
          confirmPassword: ConfirmedPasswordInput.pure(),
          submission: Initial(),
        ),
      );
    });

    blocTest<SignupCubit, SignupState>(
      'emits [SignupState] when onUsernameChanged is called',
      build: () => signupCubit,
      act: (cubit) => cubit.onUsernameChanged('john'),
      expect: () => [const SignupState(username: NonEmptyInput.dirty('john'))],
    );

    blocTest<SignupCubit, SignupState>(
      'emits [SignupState] when onEmailChanged is called',
      build: () => signupCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const SignupState(email: EmailInput.dirty('john@example.com'))],
    );

    blocTest<SignupCubit, SignupState>(
      'emits [SignupState] when onConfirmPasswordChanged is called',
      build: () => signupCubit,
      act: (cubit) => cubit.onConfirmPasswordChanged('password'),
      expect: () => [
        const SignupState(
          confirmPassword: ConfirmedPasswordInput.dirty(password: '', value: 'password'),
        ),
      ],
    );
  });
}
