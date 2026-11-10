import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(ConfirmValueValidator, () {
    test('accepts a matching value', () {
      const validator = ConfirmValueValidator('secret');

      expect(validator.validate('secret'), isNull);
    });

    test('rejects a different value', () {
      const validator = ConfirmValueValidator('secret');

      expect(validator.validate('other'), ConfirmValueValidationError.invalid);
      expect(validator.validate(''), ConfirmValueValidationError.invalid);
    });
  });
}
