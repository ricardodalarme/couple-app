import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/dates/data/mappers/important_date_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a date kind survives a trip to the remote enum and back', () {
    for (final value in ImportantDateKind.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown date kind is a custom date', () {
    expect(EnumImportantDateKind.$unknown.toModel(), ImportantDateKind.custom);
  });

  test('every date origin has a stored value', () {
    expect(ImportantDateOrigin.manual.toRemote(), EnumImportantDateOrigin.manual);
    expect(ImportantDateOrigin.auto.toRemote(), EnumImportantDateOrigin.auto);
    expect(ImportantDateOrigin.chat.toRemote(), EnumImportantDateOrigin.chat);
  });
}
