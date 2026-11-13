part of 'first_slip_cubit.dart';

final class const FirstSlipState({
  final FormInput<String> text = const FormInput(''),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  FirstSlipState copyWith({FormInput<String>? text, Resource<void>? saveAction}) {
    return FirstSlipState(text: text ?? this.text, saveAction: saveAction ?? this.saveAction);
  }

  @override
  List<Object?> get props => [text, saveAction];
}
