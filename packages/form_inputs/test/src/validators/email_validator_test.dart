import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(EmailValidator, () {
    const validator = EmailValidator();

    test('accepts valid email addresses', () {
      const emails = [
        'test@example.com',
        'user.name@example.com',
        'user+label@example.com',
        'user-name@example.co',
        'user.name@example.co.uk',
      ];

      for (final email in emails) {
        expect(validator.validate(email), isNull, reason: email);
      }
    });

    test('rejects invalid email addresses', () {
      const emails = [
        '',
        'plainaddress',
        'missing-at.example.com',
        'missing-domain@',
        '@missing-local.com',
        'spaces in@example.com',
        'double@@example.com',
      ];

      for (final email in emails) {
        expect(validator.validate(email), EmailValidationError.invalid, reason: email);
      }
    });
  });
}
