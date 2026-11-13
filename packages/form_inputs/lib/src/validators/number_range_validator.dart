import 'package:form_inputs/src/validators/validator.dart';

enum NumberRangeValidationError() {
  outOfRange,
}

/// Rejects numbers outside [min]..[max].
class const NumberRangeValidator<T extends num>(final T min, final T max) implements Validator<T> {
  @override
  NumberRangeValidationError? validate(T value) {
    if (value < min || value > max) return .outOfRange;
    return null;
  }
}
