import 'package:equatable/equatable.dart';

final class SettingsLocal with EquatableMixin {
  const SettingsLocal({
    required this.hasOnboarded,
    required this.useBiometrics,
  });

  SettingsLocal.fromMap(Map<String, dynamic> map)
      : hasOnboarded = map['hasOnboarded'] as bool,
        useBiometrics = map['useBiometrics'] as bool;

  final bool hasOnboarded;
  final bool useBiometrics;

  Map<String, dynamic> toMap() => {
        'hasOnboarded': hasOnboarded,
        'useBiometrics': useBiometrics,
      };

  @override
  List<Object?> get props => [
        hasOnboarded,
        useBiometrics,
      ];
}
