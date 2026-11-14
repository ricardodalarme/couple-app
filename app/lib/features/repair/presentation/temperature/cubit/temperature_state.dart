part of 'temperature_cubit.dart';

/// Where the person is in the check.
enum TemperatureStep() {
  level,
  intensity,
  result,
}

final class const TemperatureState({
  final TemperatureStep step = TemperatureStep.level,
  final Temperature? level,
  final int intensity = 5,
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  /// The next step once the check is finished, or null for a good level.
  RepairPath? get path {
    final current = level;

    return current == null ? null : pathFor(level: current, intensity: intensity);
  }

  TemperatureState copyWith({
    TemperatureStep? step,
    Temperature? level,
    int? intensity,
    Resource<void>? saveAction,
  }) {
    return TemperatureState(
      step: step ?? this.step,
      level: level ?? this.level,
      intensity: intensity ?? this.intensity,
      saveAction: saveAction ?? this.saveAction,
    );
  }

  @override
  List<Object?> get props => [step, level, intensity, saveAction];
}
