import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(CompositeValidator, () {
    test('returns null when every validator passes', () {
      const validator = CompositeValidator<String>([NonEmptyValidator(), EmailValidator()]);

      expect(validator.validate('user@example.com'), isNull);
    });

    test('returns the first non-null error', () {
      const validator = CompositeValidator<String>([NonEmptyValidator(), EmailValidator()]);

      expect(validator.validate(''), NonEmptyValidationError.empty);
      expect(validator.validate('not-an-email'), EmailValidationError.invalid);
    });

    test('returns null when the validator list is empty', () {
      const validator = CompositeValidator<String>([]);

      expect(validator.validate('anything'), isNull);
    });
  });
}
