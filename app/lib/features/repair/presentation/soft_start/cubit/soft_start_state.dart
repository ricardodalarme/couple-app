part of 'soft_start_cubit.dart';

final class const SoftStartState({
  final FormInput<String> feeling = const FormInput(''),
  final FormInput<String> situation = const FormInput(''),
  final FormInput<String> need = const FormInput(''),
}) with Equatable {
  SoftStartState copyWith({
    FormInput<String>? feeling,
    FormInput<String>? situation,
    FormInput<String>? need,
  }) {
    return SoftStartState(
      feeling: feeling ?? this.feeling,
      situation: situation ?? this.situation,
      need: need ?? this.need,
    );
  }

  @override
  List<Object?> get props => [feeling, situation, need];
}
