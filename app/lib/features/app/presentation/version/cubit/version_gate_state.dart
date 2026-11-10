part of 'version_gate_cubit.dart';

final class const VersionGateState({
  final bool isChecking = false,
  final bool updateRequired = false,
  final String? installedVersion,
  final String? minVersion,
}) with Equatable {
  VersionGateState copyWith({
    bool? isChecking,
    bool? updateRequired,
    String? installedVersion,
    String? minVersion,
  }) => VersionGateState(
    isChecking: isChecking ?? this.isChecking,
    updateRequired: updateRequired ?? this.updateRequired,
    installedVersion: installedVersion ?? this.installedVersion,
    minVersion: minVersion ?? this.minVersion,
  );

  @override
  List<Object?> get props => [isChecking, updateRequired, installedVersion, minVersion];
}
