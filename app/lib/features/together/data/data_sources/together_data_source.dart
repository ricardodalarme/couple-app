import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/AddLogisticItem.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/ClearLogisticItemAssignee.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/ClearLogisticItemDone.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/DeleteLogisticItem.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/SetLogisticItemAssignee.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/mutations/generated/SetLogisticItemDone.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/queries/generated/LogisticItems.graphql.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/queries/generated/MyCouple.graphql.dart';
import 'package:network/network.dart';

class TogetherDataSource({required final GQLClient _client}) {
  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() async {
    final response = await _client.query(
      OptionsQueryMyCouple(fetchPolicy: FetchPolicy.networkOnly),
    );

    return validateResponseData(response, getData: (data) => data.myCouple?.id);
  }

  Future<List<QueryLogisticItemslogisticItemsCollectionedgesnode>> getLogisticItems() async {
    final response = await _client.query(
      OptionsQueryLogisticItems(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.logisticItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> addLogisticItem({
    required String id,
    required String title,
    String? assigneeId,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddLogisticItem(
        variables: VariablesMutationAddLogisticItem(
          id: id,
          title: title,
          assigneeId: assigneeId,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> setLogisticItemDone({required String id, required DateTime? doneAt}) async {
    final response = doneAt == null
        ? await _client.mutate(
            OptionsMutationClearLogisticItemDone(
              variables: VariablesMutationClearLogisticItemDone(id: id),
            ),
          )
        : await _client.mutate(
            OptionsMutationSetLogisticItemDone(
              variables: VariablesMutationSetLogisticItemDone(id: id, doneAt: doneAt),
            ),
          );

    validateResponse(response);
  }

  /// Gives the item to one person, or to both when [assigneeId] is null.
  Future<void> setLogisticItemAssignee({required String id, String? assigneeId}) async {
    final response = assigneeId == null
        ? await _client.mutate(
            OptionsMutationClearLogisticItemAssignee(
              variables: VariablesMutationClearLogisticItemAssignee(id: id),
            ),
          )
        : await _client.mutate(
            OptionsMutationSetLogisticItemAssignee(
              variables: VariablesMutationSetLogisticItemAssignee(id: id, assigneeId: assigneeId),
            ),
          );

    validateResponse(response);
  }

  Future<void> deleteLogisticItem(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteLogisticItem(variables: VariablesMutationDeleteLogisticItem(id: id)),
    );

    validateResponse(response);
  }
}
