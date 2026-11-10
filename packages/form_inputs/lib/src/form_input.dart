import 'package:equatable/equatable.dart';
import 'package:form_inputs/src/validators/validator.dart';

class const FormInput<T>(final T value, {final Enum? error}) with Equatable {
  bool get isValid => error == null;
  String? get errorName => error?.name;

  FormInput<T> toPure() => FormInput<T>(value);

  FormInput<T> validate(Validator<T> validator) {
    final error = validator.validate(value);

    if (error != null) return FormInput(value, error: error);
    return this;
  }

  @override
  List<Object?> get props => [value, error];
}
