import 'package:formz/formz.dart';

enum NonEmptyValidationError() {
  empty,
}

class NonEmptyInput extends FormzInput<String, NonEmptyValidationError> {
  const new pure({String value = ''}) : super.pure(value);
  const new dirty(super.value) : super.dirty();

  @override
  NonEmptyValidationError? validator(String value) {
    if (value.isEmpty) {
      return NonEmptyValidationError.empty;
    }
    return null;
  }
}
