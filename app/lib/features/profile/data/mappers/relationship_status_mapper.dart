import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';

extension EnumRelationshipStatusMapper on EnumRelationshipStatus {
  /// An unknown status is treated as together.
  RelationshipStatus toModel() => switch (this) {
    EnumRelationshipStatus.together ||
    EnumRelationshipStatus.$unknown => RelationshipStatus.together,
    EnumRelationshipStatus.on_break => RelationshipStatus.onBreak,
    EnumRelationshipStatus.ended => RelationshipStatus.ended,
    EnumRelationshipStatus.bereaved => RelationshipStatus.bereaved,
  };
}

extension RelationshipStatusMapper on RelationshipStatus {
  EnumRelationshipStatus toRemote() => switch (this) {
    RelationshipStatus.together => EnumRelationshipStatus.together,
    RelationshipStatus.onBreak => EnumRelationshipStatus.on_break,
    RelationshipStatus.ended => EnumRelationshipStatus.ended,
    RelationshipStatus.bereaved => EnumRelationshipStatus.bereaved,
  };
}
