part of 'pause_cubit.dart';

final class const PauseState({
  final FormInput<String> message = const FormInput(''),
  final String? preset,
  final PauseReturn returnChoice = PauseReturn.threeHours,
  final Resource<void> sendAction = const Initial(),
}) with Equatable {
  PauseState copyWith({
    FormInput<String>? message,
    String? preset,
    bool clearPreset = false,
    PauseReturn? returnChoice,
    Resource<void>? sendAction,
  }) {
    return PauseState(
      message: message ?? this.message,
      preset: clearPreset ? null : preset ?? this.preset,
      returnChoice: returnChoice ?? this.returnChoice,
      sendAction: sendAction ?? this.sendAction,
    );
  }

  @override
  List<Object?> get props => [message, preset, returnChoice, sendAction];
}
