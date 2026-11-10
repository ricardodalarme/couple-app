import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  group(FormInput, () {
    test('defaults to a valid input with no error', () {
      const input = FormInput('value');

      expect(input.value, 'value');
      expect(input.error, isNull);
      expect(input.isValid, isTrue);
      expect(input.errorName, isNull);
    });

    test('reports the error and invalidates when an error is present', () {
      const input = FormInput('', error: NonEmptyValidationError.empty);

      expect(input.isValid, isFalse);
      expect(input.errorName, 'empty');
    });

    test('validate returns the same instance when valid', () {
      const input = FormInput('value');

      expect(input.validate(const NonEmptyValidator()), same(input));
    });

    test('validate returns a new input carrying the error when invalid', () {
      const input = FormInput('  ');
      final validated = input.validate(const NonEmptyValidator());

      expect(validated, isNot(same(input)));
      expect(validated.value, '  ');
      expect(validated.error, NonEmptyValidationError.empty);
    });

    test('toPure clears the error and keeps the value', () {
      const input = FormInput('', error: NonEmptyValidationError.empty);
      final pure = input.toPure();

      expect(pure.value, '');
      expect(pure.error, isNull);
      expect(pure.isValid, isTrue);
    });

    test('equality is based on value and error', () {
      expect(const FormInput('a'), const FormInput('a'));
      expect(const FormInput('a').hashCode, const FormInput('a').hashCode);
      expect(const FormInput('a'), isNot(const FormInput('b')));
      expect(
        const FormInput('a', error: NonEmptyValidationError.empty),
        isNot(const FormInput('a')),
      );
    });
  });
}
