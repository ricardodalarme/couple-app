import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(PasswordValidator, () {
    final validator = PasswordValidator();

    test('accepts a password with letters, numbers and at least 8 characters', () {
      expect(validator.validate('password1'), isNull);
      expect(validator.validate('Passw0rd!'), isNull);
    });

    test('rejects a password shorter than 8 characters', () {
      expect(validator.validate('pass1'), PasswordValidationError.weak);
      expect(validator.validate('abc1234'), PasswordValidationError.weak);
    });

    test('rejects a password without a letter', () {
      expect(validator.validate('12345678'), PasswordValidationError.weak);
    });

    test('rejects a password without a number', () {
      expect(validator.validate('password'), PasswordValidationError.weak);
    });

    test('rejects an empty password', () {
      expect(validator.validate(''), PasswordValidationError.weak);
    });
  });
}
