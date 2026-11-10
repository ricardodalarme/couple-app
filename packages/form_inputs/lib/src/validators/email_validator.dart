import 'package:form_inputs/src/validators/validator.dart';

enum EmailValidationError() {
  invalid,
}

class const EmailValidator() implements Validator<String> {
  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validate(String value) {
    if (!_emailRegExp.hasMatch(value)) return .invalid;
    return null;
  }
}
