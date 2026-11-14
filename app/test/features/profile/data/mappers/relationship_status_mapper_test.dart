import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_status_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a status survives a trip to the remote enum and back', () {
    for (final value in RelationshipStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });

  test('an unknown status is treated as together', () {
    expect(EnumRelationshipStatus.$unknown.toModel(), RelationshipStatus.together);
  });
}
