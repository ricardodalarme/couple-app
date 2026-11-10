import 'package:flutter_bloc_starter/features/profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/EnsureProfile.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveIntroAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveProfileSetup.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/queries/generated/MyProfile.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/queries/generated/MySettings.graphql.dart';
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

  Future<QueryMySettingsmySettings> getMySettings() async {
    final response = await _client.query(
      OptionsQueryMySettings(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data.mySettings);
  }

  Future<void> saveIntroAnswers(VariablesMutationSaveIntroAnswers variables) async {
    final response = await _client.mutate(OptionsMutationSaveIntroAnswers(variables: variables));

    validateResponse(response);
  }

  Future<void> saveProfileSetup(VariablesMutationSaveProfileSetup variables) async {
    final response = await _client.mutate(OptionsMutationSaveProfileSetup(variables: variables));

    validateResponse(response);
  }
}
