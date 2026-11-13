import 'package:form_inputs/src/validators/validator.dart';

enum PatternValidationError() {
  invalid,
}

/// Accepts only values matching [pattern]; the pattern itself belongs to the caller.
class PatternValidator(final RegExp pattern) implements Validator<String> {
  @override
  PatternValidationError? validate(String value) {
    if (pattern.hasMatch(value)) return null;
    return .invalid;
  }
}
