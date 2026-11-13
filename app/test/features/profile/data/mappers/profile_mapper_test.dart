import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/fragments/generated/ProfileFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/profile_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps a profile fragment to the model', () {
    final fragment = FragmentProfileFragment.fromJson({
      'id': 'p1',
      'displayName': 'Marina',
      'avatarPath': null,
      'avatarKind': 'initial',
      'city': 'Curitiba',
      'pronouns': null,
      '__typename': 'Profiles',
    });

    expect(
      fragment.toModel(),
      const Profile(id: 'p1', avatarKind: 'initial', displayName: 'Marina', city: 'Curitiba'),
    );
  });
}
