import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

/// The relationship fields shown on the relationship settings screen.
final class const RelationshipDetails({
  required final String profileId,
  final RelationshipPhase? phase,
  final DateTime? togetherSince,
  final String? partnerName,
}) with Equatable {
  /// A skeleton placeholder, never shown as a real record.
  factory fake() => RelationshipDetails(
    profileId: 'fake',
    phase: RelationshipPhase.dating,
    togetherSince: DateTime(2024),
  );

  RelationshipDetails copyWith({
    RelationshipPhase? phase,
    bool clearPhase = false,
    DateTime? togetherSince,
    bool clearTogetherSince = false,
    String? partnerName,
    bool clearPartnerName = false,
  }) => RelationshipDetails(
    profileId: profileId,
    phase: clearPhase ? null : phase ?? this.phase,
    togetherSince: clearTogetherSince ? null : togetherSince ?? this.togetherSince,
    partnerName: clearPartnerName ? null : partnerName ?? this.partnerName,
  );

  @override
  List<Object?> get props => [profileId, phase, togetherSince, partnerName];
}
