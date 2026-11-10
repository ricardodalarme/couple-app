import 'package:flutter_bloc_starter/features/profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/EnsureProfile.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveIntroAnswers.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SaveProfileSetup.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/SetWidgetInDiscreet.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateDisplayName.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdatePronouns.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateRelationshipPhase.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateRelationshipStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTheme.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTimeZone.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/mutations/generated/UpdateTogetherSince.graphql.dart';
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

  Future<void> setWidgetInDiscreet({required String profileId, required bool hide}) async {
    final response = await _client.mutate(
      OptionsMutationSetWidgetInDiscreet(
        variables: VariablesMutationSetWidgetInDiscreet(profileId: profileId, $hide: hide),
      ),
    );

    validateResponse(response);
  }

  Future<int> updateDisplayName(VariablesMutationUpdateDisplayName variables) async {
    final response = await _client.mutate(OptionsMutationUpdateDisplayName(variables: variables));

    return validateResponseData(
      response,
      getData: (data) => data.updateProfilesCollection.affectedCount,
    );
  }

  Future<int> updatePronouns(VariablesMutationUpdatePronouns variables) async {
    final response = await _client.mutate(OptionsMutationUpdatePronouns(variables: variables));

    return validateResponseData(
      response,
      getData: (data) => data.updateProfilesCollection.affectedCount,
    );
  }

  Future<int> updateTheme(VariablesMutationUpdateTheme variables) async {
    final response = await _client.mutate(OptionsMutationUpdateTheme(variables: variables));

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }

  Future<int> updateTimeZone(VariablesMutationUpdateTimeZone variables) async {
    final response = await _client.mutate(OptionsMutationUpdateTimeZone(variables: variables));

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }

  Future<int> updateRelationshipPhase(VariablesMutationUpdateRelationshipPhase variables) async {
    final response = await _client.mutate(
      OptionsMutationUpdateRelationshipPhase(variables: variables),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }

  Future<int> updateRelationshipStatus(VariablesMutationUpdateRelationshipStatus variables) async {
    final response = await _client.mutate(
      OptionsMutationUpdateRelationshipStatus(variables: variables),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }

  Future<int> updateTogetherSince(VariablesMutationUpdateTogetherSince variables) async {
    final response = await _client.mutate(OptionsMutationUpdateTogetherSince(variables: variables));

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }
}
