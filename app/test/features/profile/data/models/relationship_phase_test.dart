import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_phase_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps server phase values to domain values', () {
    expect(RelationshipPhase.fromServer('living_together'), RelationshipPhase.livingTogether);
    expect(RelationshipPhase.fromServer('long_distance'), RelationshipPhase.longDistance);
    expect(RelationshipPhase.fromServer(null), isNull);
  });

  test('keeps the stored value when sending a phase', () {
    expect(RelationshipPhase.withKids.serverValue, 'with_kids');
    expect(RelationshipPhase.beginning.serverValue, 'beginning');
  });

  test('maps a domain phase to the generated source enum', () {
    expect(RelationshipPhase.livingTogether.toSource(), EnumRelationshipPhase.living_together);
    expect(EnumRelationshipPhase.long_distance.toJson(), 'long_distance');
  });

  test('a phase this build does not know maps to null', () {
    expect(RelationshipPhase.fromServer('something_new'), isNull);
  });
}
