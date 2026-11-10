import 'package:flutter_bloc_starter/features/privacy/data/data_sources/mutations/generated/GrantConsent.graphql.dart';
import 'package:flutter_bloc_starter/features/privacy/data/data_sources/queries/generated/MyConsents.graphql.dart';
import 'package:network/network.dart';

class PrivacyDataSource({required final GQLClient _client}) {
  /// Every consent row, newest first.
  Future<List<QueryMyConsentsconsentsCollectionedgesnode>> getConsents() async {
    final response = await _client.query(
      OptionsQueryMyConsents(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData(response, getData: (data) => data.consentsCollection);

    return [for (final edge in data.edges) edge.node];
  }

  Future<void> grant({required String kind, required bool granted, required String version}) async {
    final response = await _client.mutate(
      OptionsMutationGrantConsent(
        variables: VariablesMutationGrantConsent(kind: kind, granted: granted, version: version),
      ),
    );

    validateResponse(response);
  }
}
