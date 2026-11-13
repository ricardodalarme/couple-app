import 'package:form_inputs/src/validators/validator.dart';

enum MaxLengthValidationError() {
  tooLong,
}

/// Rejects text longer than [max] code points, matching Postgres `char_length`.
class MaxLengthValidator(final int max) implements Validator<String> {
  @override
  MaxLengthValidationError? validate(String value) {
    if (value.runes.length <= max) return null;
    return .tooLong;
  }
}
