import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group('Password', () {
    test('should have pure constructor with empty value', () {
      const password = PasswordInput.pure();

      expect(password.value, isEmpty);
    });

    test('should have dirty constructor with specified value', () {
      const value = 'dirty_value';
      const password = PasswordInput.dirty(value);

      expect(password.value, equals(value));
    });

    test('should return null if value is a valid password', () {
      final validPasswords = ['Abcd1234', 'Password123'];

      for (final password in validPasswords) {
        final passwordInput = PasswordInput.dirty(password);

        final PasswordValidationError? validationError = passwordInput.validator(
          passwordInput.value,
        );

        expect(validationError, isNull);
      }
    });
  });
}
