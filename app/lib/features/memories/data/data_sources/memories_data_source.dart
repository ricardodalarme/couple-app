import 'package:flutter_bloc_starter/features/memories/data/data_sources/mutations/generated/AddMemory.graphql.dart';
import 'package:flutter_bloc_starter/features/memories/data/data_sources/mutations/generated/DeleteMemory.graphql.dart';
import 'package:flutter_bloc_starter/features/memories/data/data_sources/mutations/generated/DrawFromJar.graphql.dart';
import 'package:flutter_bloc_starter/features/memories/data/data_sources/queries/generated/Memories.graphql.dart';
import 'package:network/network.dart';

class MemoriesDataSource({required final GQLClient _client}) {
  Future<List<QueryMemoriesmemoriesCollectionedgesnode>> getMemories() async {
    final response = await _client.query(
      OptionsQueryMemories(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(response, getData: (data) => data.memoriesCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  Future<void> addMemory({
    required String id,
    required String title,
    required DateTime happenedOn,
    String? body,
    String? place,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddMemory(
        variables: VariablesMutationAddMemory(
          id: id,
          title: title,
          body: body,
          happenedOn: happenedOn,
          place: place,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> deleteMemory(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteMemory(variables: VariablesMutationDeleteMemory(id: id)),
    );

    validateResponse(response);
  }

  /// One random slip the person put in the jar, or null when the jar is empty.
  Future<String?> drawFromJar() async {
    final response = await _client.mutate(OptionsMutationDrawFromJar());

    return validateResponseData(response, getData: (data) => data.drawFromJar?.body);
  }
}
