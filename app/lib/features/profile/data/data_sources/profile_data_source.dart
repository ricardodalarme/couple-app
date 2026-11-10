import 'package:flutter_bloc_starter/features/profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/EnsureProfile.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/queries/generated/MyProfile.graphql.dart';
import 'package:network/network.dart';

class ProfileDataSource({required final GQLClient _client}) {
  Future<FragmentProfileFragment> getMyProfile() async {
    final response = await _client.query(
      OptionsQueryMyProfile(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data.myProfile);
  }

  Future<FragmentProfileFragment> ensureProfile() async {
    final response = await _client.mutate(OptionsMutationEnsureProfile());

    return validateResponseData(response, getData: (data) => data.ensureProfile);
  }
}
