import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/mappers/list_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_item_status.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a list kind survives a trip to the remote enum and back', () {
    for (final value in ListKind.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a list item status survives a trip to the remote enum and back', () {
    for (final value in ListItemStatus.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown value is an error, not a guess', () {
    expect(() => EnumListKind.$unknown.toModel(), throwsFormatException);
    expect(() => EnumListItemStatus.$unknown.toModel(), throwsFormatException);
  });
}
