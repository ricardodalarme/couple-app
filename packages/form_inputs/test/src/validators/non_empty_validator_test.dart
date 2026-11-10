import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(NonEmptyValidator, () {
    const validator = NonEmptyValidator();

    test('accepts a non-empty value', () {
      expect(validator.validate('value'), isNull);
    });

    test('rejects an empty value', () {
      expect(validator.validate(''), NonEmptyValidationError.empty);
    });

    test('rejects a whitespace-only value', () {
      expect(validator.validate('   '), NonEmptyValidationError.empty);
      expect(validator.validate('\n\t'), NonEmptyValidationError.empty);
    });
  });
}
