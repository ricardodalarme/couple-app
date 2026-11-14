import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_goal.dart';

extension RelationshipGoalMapper on RelationshipGoal {
  /// The text stored in `profile_settings.goals`, which is a list of text.
  String toRemote() => switch (this) {
    RelationshipGoal.reconnect => 'reconnect',
    RelationshipGoal.fightLess => 'fight_less',
    RelationshipGoal.keepRomance => 'keep_romance',
    RelationshipGoal.rememberDates => 'remember_dates',
    RelationshipGoal.organizeRoutine => 'organize_routine',
    RelationshipGoal.justRecord => 'just_record',
  };

  /// The single goal the account keeps as its main one, for goals that have one.
  EnumRelationshipGoal? toPrimaryRemote() => switch (this) {
    RelationshipGoal.reconnect => EnumRelationshipGoal.reconnect,
    RelationshipGoal.fightLess => EnumRelationshipGoal.after_fight,
    RelationshipGoal.keepRomance => EnumRelationshipGoal.keep,
    _ => null,
  };
}

extension RemoteGoalMapper on String {
  /// Null for a stored goal this version does not know.
  RelationshipGoal? toRelationshipGoal() => switch (this) {
    'reconnect' => RelationshipGoal.reconnect,
    'fight_less' => RelationshipGoal.fightLess,
    'keep_romance' => RelationshipGoal.keepRomance,
    'remember_dates' => RelationshipGoal.rememberDates,
    'organize_routine' => RelationshipGoal.organizeRoutine,
    'just_record' => RelationshipGoal.justRecord,
    _ => null,
  };
}
