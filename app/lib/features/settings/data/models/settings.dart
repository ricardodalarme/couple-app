import 'package:equatable/equatable.dart';

/// Device-local preferences, including the introduction answers kept until sign-in.
final class const Settings({
  final bool useBiometrics = false,
  final String themeVariant = 'rose',
  final int introStep = 0,
  final String? introPhase,
  final List<String> introGoals = const [],
  final bool introUploaded = false,
  final double textScale = 1,
  final bool reduceMotion = false,
  final bool highContrast = false,
  final String locale = 'pt',
}) with Equatable {
  const new empty() : this();

  factory fromMap(Map<String, dynamic> map) => Settings(
    useBiometrics: map['useBiometrics'] as bool? ?? false,
    themeVariant: map['themeVariant'] as String? ?? 'rose',
    introStep: map['introStep'] as int? ?? 0,
    introPhase: map['introPhase'] as String?,
    introGoals: (map['introGoals'] as List<dynamic>?)?.cast<String>() ?? const [],
    introUploaded: map['introUploaded'] as bool? ?? false,
    textScale: (map['textScale'] as num?)?.toDouble() ?? 1,
    reduceMotion: map['reduceMotion'] as bool? ?? false,
    highContrast: map['highContrast'] as bool? ?? false,
    locale: map['locale'] as String? ?? 'pt',
  );

  /// Whether the answers still have to be sent to the server.
  bool get hasPendingIntroAnswers =>
      !introUploaded && (introPhase != null || introGoals.isNotEmpty);

  Settings copyWith({
    bool? useBiometrics,
    String? themeVariant,
    int? introStep,
    String? introPhase,
    List<String>? introGoals,
    bool? introUploaded,
    double? textScale,
    bool? reduceMotion,
    bool? highContrast,
    String? locale,
  }) => Settings(
    useBiometrics: useBiometrics ?? this.useBiometrics,
    themeVariant: themeVariant ?? this.themeVariant,
    introStep: introStep ?? this.introStep,
    introPhase: introPhase ?? this.introPhase,
    introGoals: introGoals ?? this.introGoals,
    introUploaded: introUploaded ?? this.introUploaded,
    textScale: textScale ?? this.textScale,
    reduceMotion: reduceMotion ?? this.reduceMotion,
    highContrast: highContrast ?? this.highContrast,
    locale: locale ?? this.locale,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'useBiometrics': useBiometrics,
    'themeVariant': themeVariant,
    'introStep': introStep,
    'introPhase': introPhase,
    'introGoals': introGoals,
    'introUploaded': introUploaded,
    'textScale': textScale,
    'reduceMotion': reduceMotion,
    'highContrast': highContrast,
    'locale': locale,
  };

  @override
  List<Object?> get props => [
    useBiometrics,
    themeVariant,
    introStep,
    introPhase,
    introGoals,
    introUploaded,
    textScale,
    reduceMotion,
    highContrast,
    locale,
  ];
}
