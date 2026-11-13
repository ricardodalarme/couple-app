import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(MinLengthValidator, () {
    final validator = MinLengthValidator(3);

    test('accepts a value at the limit', () {
      expect(validator.validate('abc'), isNull);
    });

    test('rejects a shorter value', () {
      expect(validator.validate('ab'), MinLengthValidationError.tooShort);
      expect(validator.validate(''), MinLengthValidationError.tooShort);
    });
  });
}
