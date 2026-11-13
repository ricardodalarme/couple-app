import 'package:form_inputs/src/validators/validator.dart';

enum NonEmptyValidationError() {
  empty,
}

class NonEmptyValidator() implements Validator<String> {
  @override
  NonEmptyValidationError? validate(String value) {
    if (value.trim().isEmpty) return .empty;
    return null;
  }
}
