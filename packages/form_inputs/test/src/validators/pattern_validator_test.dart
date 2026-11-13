import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(PatternValidator, () {
    final validator = PatternValidator(RegExp(r'^[A-Z0-9]{8}$'));

    test('accepts a matching value', () {
      expect(validator.validate('ABCD1234'), isNull);
    });

    test('rejects a value that does not match', () {
      expect(validator.validate('abcd1234'), PatternValidationError.invalid);
      expect(validator.validate('ABCD123'), PatternValidationError.invalid);
    });
  });
}
