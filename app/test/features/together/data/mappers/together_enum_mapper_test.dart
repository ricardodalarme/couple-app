import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/mappers/together_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea_status.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual_cadence.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a ritual cadence survives a trip to the remote enum and back', () {
    for (final value in RitualCadence.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a date idea status survives a trip to the remote enum and back', () {
    for (final value in DateIdeaStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown value is an error, not a guess', () {
    expect(() => EnumRitualCadence.$unknown.toModel(), throwsFormatException);
    expect(() => EnumDateIdeaStatus.$unknown.toModel(), throwsFormatException);
  });
}
