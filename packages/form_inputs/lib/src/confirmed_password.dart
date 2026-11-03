import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError() {
  invalid,
}

class ConfirmedPasswordInput extends FormzInput<String, ConfirmedPasswordValidationError> {
  const new pure({this.password = '', String value = ''}) : super.pure(value);

  const new dirty({required this.password, String value = ''}) : super.dirty(value);

  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
