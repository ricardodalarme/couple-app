import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';

void main() {
  const username = NonEmptyInput.dirty('username');
  const email = EmailInput.dirty('email');
  const password = PasswordInput.dirty('password');
  const confirmPassword = ConfirmedPasswordInput.dirty(
    password: 'password',
  );

  group('SignupState', () {
    test('returns same object when no properties are passed', () {
      expect(const SignupState().copyWith(), const SignupState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const SignupState().copyWith(status: FormzSubmissionStatus.initial),
        const SignupState(),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(
        const SignupState().copyWith(username: username),
        const SignupState(username: username),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        const SignupState().copyWith(email: email),
        const SignupState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const SignupState().copyWith(password: password),
        const SignupState(password: password),
      );
    });

    test(
        'returns object with updated confirmPassword when confirmPassword is passed',
        () {
      expect(
        const SignupState().copyWith(confirmPassword: confirmPassword),
        const SignupState(confirmPassword: confirmPassword),
      );
    });
  });
}
