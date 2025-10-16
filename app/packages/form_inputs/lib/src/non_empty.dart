import 'package:formz/formz.dart';

enum NonEmptyValidationError { empty }

class NonEmptyInput extends FormzInput<String, NonEmptyValidationError> {
  const NonEmptyInput.pure({String value = ''}) : super.pure(value);
  const NonEmptyInput.dirty(super.value) : super.dirty();

  @override
  NonEmptyValidationError? validator(String value) {
    if (value.isEmpty) {
      return NonEmptyValidationError.empty;
    }
    return null;
  }
}
