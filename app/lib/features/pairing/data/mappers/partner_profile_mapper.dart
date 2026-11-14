import 'package:flutter_bloc_starter/features/pairing/data/data_sources/remote/queries/generated/MyPartner.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/avatar_kind_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/profile.dart';

/// The partner row as the profile model the rest of the app reads.
extension PartnerProfileMapper on QueryMyPartnermyPartner {
  Profile toModel() => Profile(
    id: id,
    avatarKind: avatarKind.toModel(),
    displayName: displayName,
    avatarPath: avatarPath,
    city: city,
    pronouns: pronouns,
  );
}
