part of 'pause_cubit.dart';

final class const PauseState({
  final String message = '',
  final String? preset,
  final PauseReturn returnChoice = PauseReturn.threeHours,
  final Resource<void> sendAction = const Initial(),
}) with Equatable {
  /// Whether the message is filled and within its limit.
  bool get canSend => message.trim().isNotEmpty && message.length <= pauseMessageMaxLength;

  PauseState copyWith({
    String? message,
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
