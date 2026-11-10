import 'package:flutter_bloc_starter/features/profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';

extension ProfileFragmentMapper on FragmentProfileFragment {
  Profile toModel() => Profile(
    id: id,
    avatarKind: avatarKind,
    displayName: displayName,
    avatarPath: avatarPath,
    city: city,
    pronouns: pronouns,
  );
}
