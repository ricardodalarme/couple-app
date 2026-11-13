import 'package:flutter_bloc_starter/features/partner/data/data_sources/remote/mutations/generated/AddPartnerFact.graphql.dart';
import 'package:flutter_bloc_starter/features/partner/data/data_sources/remote/mutations/generated/DeletePartnerFact.graphql.dart';
import 'package:flutter_bloc_starter/features/partner/data/data_sources/remote/queries/generated/PartnerFacts.graphql.dart';
import 'package:network/network.dart';

class PartnerDataSource({required final GQLClient _client}) {
  Future<List<QueryPartnerFactspartnerFactsCollectionedgesnode>> getFacts() async {
    final response = await _client.query(
      OptionsQueryPartnerFacts(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.partnerFactsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> addFact({
    required String id,
    required String label,
    required String value,
    String? category,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddPartnerFact(
        variables: VariablesMutationAddPartnerFact(
          id: id,
          label: label,
          value: value,
          category: category,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteFact(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeletePartnerFact(variables: VariablesMutationDeletePartnerFact(id: id)),
    );

    validateResponse(response);
  }
}
