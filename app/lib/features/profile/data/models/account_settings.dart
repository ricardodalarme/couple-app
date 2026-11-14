import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_goal.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

/// How readily the person lets the partner see a heavy-day notice.
enum HeavyDaySharing() {
  off,
  ask,
  always,
}

final class const AccountSettings({
  required final AppThemeVariant theme,
  final String profileId = '',
  final String timeZone = 'UTC',
  final String? partnerName,
  final DateTime? togetherSince,
  final DateTime? onboardedAt,
  final bool shareReadReceipts = false,
  final bool widgetInDiscreet = false,
  final HeavyDaySharing heavyDaySharing = HeavyDaySharing.off,
  final RelationshipPhase? phase,
  final List<RelationshipGoal> goals = const [],
  final String locale = 'pt-BR',
}) with Equatable {
  /// Whether the person finished the first profile step.
  bool get isOnboarded => onboardedAt != null;

  @override
  List<Object?> get props => [
    theme,
    profileId,
    timeZone,
    partnerName,
    togetherSince,
    onboardedAt,
    shareReadReceipts,
    widgetInDiscreet,
    heavyDaySharing,
    phase,
    goals,
    locale,
  ];
}
