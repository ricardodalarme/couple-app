import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/mappers/mood_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a mood survives a trip to the remote enum and back', () {
    for (final value in MoodKind.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a need survives a trip to the remote enum and back', () {
    for (final value in NeedKind.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an audience survives a trip to the remote enum and back', () {
    for (final value in MoodShare.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown mood or need stays hidden', () {
    expect(EnumMood.$unknown.toModel(), isNull);
    expect(EnumMoodNeed.$unknown.toModel(), isNull);
  });

  test('an unknown audience is private', () {
    expect(EnumMoodShare.$unknown.toModel(), MoodShare.none);
  });
}
