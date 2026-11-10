import 'package:form_inputs/src/validators/validator.dart';

enum ConfirmValueValidationError() {
  invalid,
}

class const ConfirmValueValidator(final String originalValue) implements Validator<String> {
  @override
  ConfirmValueValidationError? validate(String value) {
    if (originalValue != value) return .invalid;
    return null;
  }
}
