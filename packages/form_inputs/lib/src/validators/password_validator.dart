import 'package:form_inputs/src/validators/validator.dart';

enum PasswordValidationError() {
  weak,
}

class PasswordValidator() implements Validator<String> {
  static final _letterRegExp = RegExp('[a-zA-Z]');
  static final _numberRegExp = RegExp('[0-9]');
  static const _minimumLength = 8;

  @override
  PasswordValidationError? validate(String value) {
    if (!_letterRegExp.hasMatch(value)) return .weak;
    if (!_numberRegExp.hasMatch(value)) return .weak;
    if (value.length < _minimumLength) return .weak;
    return null;
  }
}
