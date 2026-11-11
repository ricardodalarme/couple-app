import 'package:flutter_bloc_starter/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';

extension RelationshipPhaseMapper on RelationshipPhase {
  EnumRelationshipPhase toSource() => switch (this) {
    .beginning => EnumRelationshipPhase.beginning,
    .dating => EnumRelationshipPhase.dating,
    .livingTogether => EnumRelationshipPhase.living_together,
    .engaged => EnumRelationshipPhase.engaged,
    .married => EnumRelationshipPhase.married,
    .withKids => EnumRelationshipPhase.with_kids,
    .longDistance => EnumRelationshipPhase.long_distance,
    .withParents => EnumRelationshipPhase.with_parents,
    .restarting => EnumRelationshipPhase.restarting,
  };
}
