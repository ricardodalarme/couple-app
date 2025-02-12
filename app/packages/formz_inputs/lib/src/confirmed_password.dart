import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError { invalid }

class ConfirmedPasswordInput extends FormzInput<String, ConfirmedPasswordValidationError> {
  const ConfirmedPasswordInput.pure({this.password = '', String value = ''}) : super.pure(value);

  const ConfirmedPasswordInput.dirty({required this.password, String value = ''})
    : super.dirty(value);

  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
