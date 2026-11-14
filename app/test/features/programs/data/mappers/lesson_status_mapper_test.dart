import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/programs/data/mappers/lesson_status_mapper.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/program.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a lesson status survives a trip to the remote enum and back', () {
    for (final value in LessonStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown status is an error, not a guess', () {
    expect(() => EnumLessonStatus.$unknown.toModel(), throwsFormatException);
  });
}
