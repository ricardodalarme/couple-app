import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_goal_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_goal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a goal survives a trip to its stored text and back', () {
    for (final value in RelationshipGoal.values) {
      expect(value.toRemote().toRelationshipGoal(), value);
    }
  });

  test('multi-word goals keep their stored spelling', () {
    expect(RelationshipGoal.fightLess.toRemote(), 'fight_less');
    expect(RelationshipGoal.organizeRoutine.toRemote(), 'organize_routine');
  });

  test('a stored goal this version does not know is left out', () {
    expect('something_new'.toRelationshipGoal(), isNull);
  });

  test('only three goals have a main goal on the account', () {
    expect(RelationshipGoal.reconnect.toPrimaryRemote(), EnumRelationshipGoal.reconnect);
    expect(RelationshipGoal.fightLess.toPrimaryRemote(), EnumRelationshipGoal.after_fight);
    expect(RelationshipGoal.keepRomance.toPrimaryRemote(), EnumRelationshipGoal.keep);
    expect(RelationshipGoal.justRecord.toPrimaryRemote(), isNull);
  });
}
