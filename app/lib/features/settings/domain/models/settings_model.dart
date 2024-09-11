import 'package:equatable/equatable.dart';

final class SettingsModel with EquatableMixin {
  const SettingsModel({
    required this.hasOnboarded,
    required this.useBiometrics,
  });

  const SettingsModel.empty()
      : hasOnboarded = false,
        useBiometrics = false;

  final bool hasOnboarded;
  final bool useBiometrics;

  SettingsModel copyWith({
    bool? hasOnboarded,
    bool? useBiometrics,
  }) {
    return SettingsModel(
      hasOnboarded: hasOnboarded ?? this.hasOnboarded,
      useBiometrics: useBiometrics ?? this.useBiometrics,
    );
  }

  @override
  List<Object?> get props => [
        hasOnboarded,
        useBiometrics,
      ];
}
