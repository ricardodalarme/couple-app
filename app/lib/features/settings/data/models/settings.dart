import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_goal.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

/// Device-local preferences, including the introduction answers kept until sign-in.
final class const Settings({
  final bool useBiometrics = false,
  final String themeVariant = 'rose',
  final int introStep = 0,
  final RelationshipPhase? introPhase,
  final List<RelationshipGoal> introGoals = const [],
  final bool introUploaded = false,
  final String locale = 'pt',
}) with Equatable {
  const new empty() : this();

  factory fromMap(Map<String, dynamic> map) => Settings(
    useBiometrics: map['useBiometrics'] as bool? ?? false,
    themeVariant: map['themeVariant'] as String? ?? 'rose',
    introStep: map['introStep'] as int? ?? 0,
    introPhase: RelationshipPhase.values.asNameMap()[map['introPhase'] as String?],
    introGoals: [
      for (final name in (map['introGoals'] as List<dynamic>?) ?? const [])
        ?RelationshipGoal.values.asNameMap()[name],
    ],
    introUploaded: map['introUploaded'] as bool? ?? false,
    locale: map['locale'] as String? ?? 'pt',
  );

  /// Whether the answers still have to be sent to the server.
  bool get hasPendingIntroAnswers =>
      !introUploaded && (introPhase != null || introGoals.isNotEmpty);

  Settings copyWith({
    bool? useBiometrics,
    String? themeVariant,
    int? introStep,
    RelationshipPhase? introPhase,
    List<RelationshipGoal>? introGoals,
    bool? introUploaded,
    String? locale,
  }) => Settings(
    useBiometrics: useBiometrics ?? this.useBiometrics,
    themeVariant: themeVariant ?? this.themeVariant,
    introStep: introStep ?? this.introStep,
    introPhase: introPhase ?? this.introPhase,
    introGoals: introGoals ?? this.introGoals,
    introUploaded: introUploaded ?? this.introUploaded,
    locale: locale ?? this.locale,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'useBiometrics': useBiometrics,
    'themeVariant': themeVariant,
    'introStep': introStep,
    'introPhase': introPhase?.name,
    'introGoals': [for (final goal in introGoals) goal.name],
    'introUploaded': introUploaded,
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
    locale,
  ];
}
