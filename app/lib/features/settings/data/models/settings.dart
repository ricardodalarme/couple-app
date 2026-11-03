import 'package:equatable/equatable.dart';

final class Settings with Equatable {
  const new({required this.hasOnboarded, required this.useBiometrics});

  const new empty() : hasOnboarded = false, useBiometrics = false;

  factory fromMap(Map<String, dynamic> map) => Settings(
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
