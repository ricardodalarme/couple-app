import 'package:form_inputs/src/validators/validator.dart';

enum MinLengthValidationError() {
  tooShort,
}

/// Rejects text shorter than [min] code points.
class const MinLengthValidator(final int min) implements Validator<String> {
  @override
  MinLengthValidationError? validate(String value) {
    if (value.runes.length >= min) return null;
    return .tooShort;
  }
}
