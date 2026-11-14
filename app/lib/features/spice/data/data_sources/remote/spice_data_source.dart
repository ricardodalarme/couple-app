import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/mutations/generated/SetSpiceEnabled.graphql.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/queries/generated/MySpiceSetting.graphql.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/queries/generated/SpiceCards.graphql.dart';
import 'package:network/network.dart';

class SpiceDataSource({required final GQLClient _client}) {
  /// Whether the person switched the mode on; false when no settings row is found.
  Future<bool> getEnabled(String profileId) async {
    final response = await _client.query(
      OptionsQueryMySpiceSetting(
        variables: VariablesQueryMySpiceSetting(profileId: profileId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    validateResponse(response);

    return response.parsedData?.profileSettingsByPk?.spiceEnabled ?? false;
  }

  Future<int> setEnabled({required String profileId, required bool enabled}) async {
    final response = await _client.mutate(
      OptionsMutationSetSpiceEnabled(
        variables: VariablesMutationSetSpiceEnabled(profileId: profileId, enabled: enabled),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateProfileSettingsCollection.affectedCount,
    );
  }

  /// The card texts; the server returns none unless both people switched the mode on.
  Future<List<String>> getCards(String locale) async {
    final response = await _client.query(
      OptionsQuerySpiceCards(
        variables: VariablesQuerySpiceCards(locale: locale),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.contentItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node.title];
  }
}
