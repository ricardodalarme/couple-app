import 'package:flutter_test/flutter_test.dart';
import 'package:formz_inputs/formz_inputs.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';

void main() {
  const username = NonEmptyInput.dirty('username');
  const password = NonEmptyInput.dirty('password');

  group('LoginState', () {
    test('returns same object when no properties are passed', () {
      expect(const LoginState().copyWith(), const LoginState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const LoginState().copyWith(status: FormzSubmissionStatus.initial),
        const LoginState(),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(
        const LoginState().copyWith(username: username),
        const LoginState(username: username),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        const LoginState().copyWith(password: password),
        const LoginState(password: password),
      );
    });
  });
}
