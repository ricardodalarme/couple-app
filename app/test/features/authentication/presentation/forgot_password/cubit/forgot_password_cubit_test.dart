import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository() extends Mock implements AuthenticationRepository;

void main() {
  group('ForgotPasswordCubit', () {
    late AuthenticationRepository authenticationRepository;
    late ForgotPasswordCubit forgotPasswordCubit;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      forgotPasswordCubit = ForgotPasswordCubit(authenticationRepository: authenticationRepository);
    });

    tearDown(() {
      forgotPasswordCubit.close();
    });

    test('initial state is correct', () {
      expect(forgotPasswordCubit.state, const ForgotPasswordState());
    });

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'emits [ForgotPasswordState] when onEmailChanged is called',
      build: () => forgotPasswordCubit,
      act: (cubit) => cubit.onEmailChanged('john@example.com'),
      expect: () => [const ForgotPasswordState(email: FormInput('john@example.com'))],
    );

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'emits an email error and does not reset the password when the email is invalid',
      build: () => forgotPasswordCubit,
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const ForgotPasswordState(email: FormInput('', error: EmailValidationError.invalid)),
      ],
      verify: (_) {
        verifyNever(() => authenticationRepository.resetPassword(email: any(named: 'email')));
      },
    );

    blocTest<ForgotPasswordCubit, ForgotPasswordState>(
      'resets the password and emits [Loading, Success] when the email is valid',
      build: () {
        when(() => authenticationRepository.resetPassword(email: any(named: 'email')))
            .thenAnswer((_) async {});

        return forgotPasswordCubit;
      },
      seed: () => const ForgotPasswordState(email: FormInput('john@example.com')),
      act: (cubit) => cubit.onSubmit(),
      expect: () => [
        const ForgotPasswordState(email: FormInput('john@example.com'), submission: Loading()),
        const ForgotPasswordState(email: FormInput('john@example.com'), submission: Success(null)),
      ],
      verify: (_) {
        verify(() => authenticationRepository.resetPassword(email: 'john@example.com')).called(1);
      },
    );
  });
}
