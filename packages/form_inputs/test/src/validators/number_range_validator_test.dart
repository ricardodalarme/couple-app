import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(NumberRangeValidator, () {
    final validator = NumberRangeValidator(1, 12);

    test('accepts the bounds', () {
      expect(validator.validate(1), isNull);
      expect(validator.validate(12), isNull);
    });

    test('rejects values outside the range', () {
      expect(validator.validate(0), NumberRangeValidationError.outOfRange);
      expect(validator.validate(13), NumberRangeValidationError.outOfRange);
    });
  });
}
