import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('ConfirmedPassword', () {
    test('should have pure constructor with empty value', () {
      const password = 'password';
      const confirmedPassword = ConfirmedPasswordInput.pure(password: password);

      expect(confirmedPassword.value, isEmpty);
      expect(confirmedPassword.password, equals(password));
    });

    test('should have dirty constructor with specified value', () {
      const password = 'password';
      const value = 'dirty_value';
      const confirmedPassword = ConfirmedPasswordInput.dirty(password: password, value: value);

      expect(confirmedPassword.value, equals(value));
      expect(confirmedPassword.password, equals(password));
    });

    test('should return null if value matches the password', () {
      const password = 'password';
      const confirmedPassword = ConfirmedPasswordInput.dirty(password: password, value: password);

      final ConfirmedPasswordValidationError? validationError = confirmedPassword.validator(
        confirmedPassword.value,
      );

      expect(validationError, isNull);
    });

    test('should return invalid if value does not match the password', () {
      const password = 'password';
      const confirmedPassword = ConfirmedPasswordInput.dirty(
        password: password,
        value: 'wrong_password',
      );

      final ConfirmedPasswordValidationError? validationError = confirmedPassword.validator(
        confirmedPassword.value,
      );

      expect(validationError, equals(ConfirmedPasswordValidationError.invalid));
    });
  });
}
