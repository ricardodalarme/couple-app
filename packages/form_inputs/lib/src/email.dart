import 'package:formz/formz.dart';

enum EmailValidationError() {
  invalid,
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const new pure() : super.pure('');
  const new dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}
