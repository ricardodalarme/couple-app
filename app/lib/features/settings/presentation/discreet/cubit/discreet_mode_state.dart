part of 'discreet_mode_cubit.dart';

final class const DiscreetModeState({
  final DiscreetModeValues values = const DiscreetModeValues(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  bool get isOn => values.isOn;

  DiscreetModeState copyWith({DiscreetModeValues? values, Resource<void>? saveAction}) =>
      DiscreetModeState(values: values ?? this.values, saveAction: saveAction ?? this.saveAction);

  @override
  List<Object?> get props => [values, saveAction];
}
