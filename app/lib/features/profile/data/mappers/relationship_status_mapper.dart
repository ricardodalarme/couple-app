import 'package:flutter_bloc_starter/features/_shared/data/data_sources/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';

extension RelationshipStatusMapper on RelationshipStatus {
  EnumRelationshipStatus toSource() => switch (this) {
    .together => EnumRelationshipStatus.together,
    .onBreak => EnumRelationshipStatus.on_break,
    .ended => EnumRelationshipStatus.ended,
    .bereaved => EnumRelationshipStatus.bereaved,
  };
}
