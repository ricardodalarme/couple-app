import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  const email = FormInput<String>('john@example.com');
  const password = FormInput<String>('password');

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

    test('returns object with updated email when email is passed', () {
      expect(const LoginState().copyWith(email: email), const LoginState(email: email));
    });

    test('returns object with updated password when password is passed', () {
      expect(const LoginState().copyWith(password: password), const LoginState(password: password));
    });
  });
}
