import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

extension EnumRelationshipPhaseMapper on EnumRelationshipPhase {
  /// Null for a phase this version does not know.
  RelationshipPhase? toModel() => switch (this) {
    EnumRelationshipPhase.beginning => RelationshipPhase.beginning,
    EnumRelationshipPhase.dating => RelationshipPhase.dating,
    EnumRelationshipPhase.living_together => RelationshipPhase.livingTogether,
    EnumRelationshipPhase.engaged => RelationshipPhase.engaged,
    EnumRelationshipPhase.married => RelationshipPhase.married,
    EnumRelationshipPhase.with_kids => RelationshipPhase.withKids,
    EnumRelationshipPhase.long_distance => RelationshipPhase.longDistance,
    EnumRelationshipPhase.with_parents => RelationshipPhase.withParents,
    EnumRelationshipPhase.restarting => RelationshipPhase.restarting,
    EnumRelationshipPhase.$unknown => null,
  };
}

extension RelationshipPhaseMapper on RelationshipPhase {
  EnumRelationshipPhase toRemote() => switch (this) {
    RelationshipPhase.beginning => EnumRelationshipPhase.beginning,
    RelationshipPhase.dating => EnumRelationshipPhase.dating,
    RelationshipPhase.livingTogether => EnumRelationshipPhase.living_together,
    RelationshipPhase.engaged => EnumRelationshipPhase.engaged,
    RelationshipPhase.married => EnumRelationshipPhase.married,
    RelationshipPhase.withKids => EnumRelationshipPhase.with_kids,
    RelationshipPhase.longDistance => EnumRelationshipPhase.long_distance,
    RelationshipPhase.withParents => EnumRelationshipPhase.with_parents,
    RelationshipPhase.restarting => EnumRelationshipPhase.restarting,
  };
}
