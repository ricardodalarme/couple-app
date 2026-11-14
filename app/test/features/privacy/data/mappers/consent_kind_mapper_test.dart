import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/privacy/data/mappers/consent_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/privacy/data/models/consent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every consent kind survives the round trip', () {
    for (final kind in ConsentKind.values) {
      expect(kind.toRemote().toModel(), kind);
    }
  });

  test('an unknown server kind fails loudly', () {
    expect(() => EnumConsentKind.$unknown.toModel(), throwsArgumentError);
  });
}
