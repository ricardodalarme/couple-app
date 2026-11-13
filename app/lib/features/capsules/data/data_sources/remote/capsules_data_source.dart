import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/mutations/generated/AddCapsule.graphql.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/mutations/generated/DeleteCapsule.graphql.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/queries/generated/Capsules.graphql.dart';
import 'package:network/network.dart';

class CapsulesDataSource({required final GQLClient _client}) {
  Future<List<QueryCapsulescapsulesCollectionedgesnode>> getCapsules() async {
    final response = await _client.query(
      OptionsQueryCapsules(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(response, getData: (data) => data.capsulesCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  Future<void> add({
    required String id,
    required String body,
    required DateTime opensOn,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddCapsule(
        variables: VariablesMutationAddCapsule(
          id: id,
          body: body,
          opensOn: opensOn,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> delete(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteCapsule(variables: VariablesMutationDeleteCapsule(id: id)),
    );

    validateResponse(response);
  }
}
