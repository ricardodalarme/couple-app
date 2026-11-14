import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/partner/data/mappers/partner_fact_category_mapper.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a fact category survives a trip to the remote enum and back', () {
    for (final value in PartnerFactCategory.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown category is left out', () {
    expect(EnumPartnerFactCategory.$unknown.toModel(), isNull);
  });
}
