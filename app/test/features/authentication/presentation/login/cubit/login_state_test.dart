import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/cubit/login_cubit.dart';

void main() {
  const username = NonEmptyInput.dirty('username');
  const password = NonEmptyInput.dirty('password');

  group('LoginState', () {
    test('returns same object when no properties are passed', () {
      expect(const LoginState().copyWith(), const LoginState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const LoginState().copyWith(login: const Success(null)),
        const LoginState(login: Success(null)),
      );
    });

    test('returns object with updated username when username is passed', () {
      expect(const LoginState().copyWith(username: username), const LoginState(username: username));
    });

    test('returns object with updated password when password is passed', () {
      expect(const LoginState().copyWith(password: password), const LoginState(password: password));
    });
  });
}
