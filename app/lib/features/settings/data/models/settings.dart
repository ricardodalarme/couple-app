import 'package:equatable/equatable.dart';

final class Settings with Equatable {
  const Settings({required this.hasOnboarded, required this.useBiometrics});

  const Settings.empty() : hasOnboarded = false, useBiometrics = false;

  factory Settings.fromMap(Map<String, dynamic> map) => Settings(
    hasOnboarded: map['hasOnboarded'] as bool,
    useBiometrics: map['useBiometrics'] as bool,
  );

  final bool hasOnboarded;
  final bool useBiometrics;

  Settings copyWith({bool? hasOnboarded, bool? useBiometrics}) => Settings(
    hasOnboarded: hasOnboarded ?? this.hasOnboarded,
    useBiometrics: useBiometrics ?? this.useBiometrics,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'hasOnboarded': hasOnboarded,
    'useBiometrics': useBiometrics,
  };

  @override
  List<Object?> get props => [hasOnboarded, useBiometrics];
}
