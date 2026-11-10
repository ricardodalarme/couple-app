import 'package:equatable/equatable.dart';

final class Settings with Equatable {
  const new({required this.hasOnboarded, required this.useBiometrics, this.themeVariant = 'rose'});

  const new empty() : hasOnboarded = false, useBiometrics = false, themeVariant = 'rose';

  factory fromMap(Map<String, dynamic> map) => Settings(
    hasOnboarded: map['hasOnboarded'] as bool,
    useBiometrics: map['useBiometrics'] as bool,
    themeVariant: map['themeVariant'] as String? ?? 'rose',
  );

  final bool hasOnboarded;
  final bool useBiometrics;
  final String themeVariant;

  Settings copyWith({bool? hasOnboarded, bool? useBiometrics, String? themeVariant}) => Settings(
    hasOnboarded: hasOnboarded ?? this.hasOnboarded,
    useBiometrics: useBiometrics ?? this.useBiometrics,
    themeVariant: themeVariant ?? this.themeVariant,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'hasOnboarded': hasOnboarded,
    'useBiometrics': useBiometrics,
    'themeVariant': themeVariant,
  };

  @override
  List<Object?> get props => [hasOnboarded, useBiometrics, themeVariant];
}
