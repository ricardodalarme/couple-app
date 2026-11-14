import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/slips/data/mappers/slip_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_category.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a slip category survives a trip to the remote enum and back', () {
    for (final value in SlipCategory.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('a work area survives a trip to the remote enum and back', () {
    for (final value in SlipWorkArea.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown category or area is left out', () {
    expect(EnumSlipCategory.$unknown.toModel(), isNull);
    expect(EnumWorkArea.$unknown.toModel(), isNull);
  });

  test('the function argument is the stored text', () {
    expect(SlipCategory.noticed.toRpc(), 'noticed');
    expect(SlipWorkArea.finances.toRpc(), 'finances');
  });
}
