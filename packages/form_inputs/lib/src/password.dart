import 'package:formz/formz.dart';

enum PasswordValidationError() {
  weak,
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const new pure() : super.pure('');
  const new dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '') ? null : PasswordValidationError.weak;
  }
}
