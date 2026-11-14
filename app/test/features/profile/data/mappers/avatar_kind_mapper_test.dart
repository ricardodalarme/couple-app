import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/avatar_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/avatar_kind.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('an avatar kind survives a trip to the remote enum and back', () {
    for (final value in AvatarKind.values) {
      expect(value.toRemote().toModel(), value);
    }
  });
  test('an unknown avatar is shown as initials', () {
    expect(EnumAvatarKind.$unknown.toModel(), AvatarKind.initials);
  });
}
