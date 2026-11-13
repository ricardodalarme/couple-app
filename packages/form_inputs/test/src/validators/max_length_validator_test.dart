import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(MaxLengthValidator, () {
    const validator = MaxLengthValidator(4);

    test('accepts a value at the limit', () {
      expect(validator.validate('abcd'), isNull);
    });

    test('rejects a longer value', () {
      expect(validator.validate('abcde'), MaxLengthValidationError.tooLong);
    });

    test('counts code points, not UTF-16 units', () {
      expect(validator.validate('😀😀😀😀'), isNull);
      expect(validator.validate('😀😀😀😀😀'), MaxLengthValidationError.tooLong);
    });
  });
}
