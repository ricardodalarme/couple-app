import 'package:form_inputs/src/validators/validator.dart';

class const CompositeValidator<T>(final List<Validator<T>> validators) implements Validator<T> {
  @override
  Enum? validate(T value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null) return error;
    }
    return null;
  }
}
