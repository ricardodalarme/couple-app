import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(ConfirmValueValidator, () {
    test('accepts a matching value', () {
      final validator = ConfirmValueValidator('secret');

      expect(validator.validate('secret'), isNull);
    });

    test('rejects a different value', () {
      final validator = ConfirmValueValidator('secret');

      expect(validator.validate('other'), ConfirmValueValidationError.invalid);
      expect(validator.validate(''), ConfirmValueValidationError.invalid);
    });
  });
}
