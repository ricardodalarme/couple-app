import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/AddLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/DeleteLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/SetLearnedItemStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/mutations/generated/UpdateLearnedItem.graphql.dart';
import 'package:flutter_bloc_starter/features/chat/data/data_sources/remote/queries/generated/LearnedItems.graphql.dart';
import 'package:network/network.dart';

class LearnedItemsDataSource({required final GQLClient _client}) {
  Future<List<QueryLearnedItemslearnedItemsCollectionedgesnode>> getItems() async {
    final response = await _client.query(
      OptionsQueryLearnedItems(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.learnedItemsCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<MutationAddLearnedIteminsertIntoLearnedItemsCollectionrecords> add({
    required EnumLearnedItemTarget target,
    required String text,
    String? excerpt,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddLearnedItem(
        variables: VariablesMutationAddLearnedItem(target: target, text: text, excerpt: excerpt),
      ),
    );
    final records = validateResponseData(
      response,
      getData: (data) => data.insertIntoLearnedItemsCollection?.records,
    );
    if (records.length != 1) throw const NoDataException();

    return records.single;
  }

  Future<void> updateText({required String id, required String text}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateLearnedItem(
        variables: VariablesMutationUpdateLearnedItem(id: id, text: text),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateLearnedItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> setStatus({required String id, required EnumLearnedItemStatus status}) async {
    final response = await _client.mutate(
      OptionsMutationSetLearnedItemStatus(
        variables: VariablesMutationSetLearnedItemStatus(id: id, status: status),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateLearnedItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> delete(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteLearnedItem(variables: VariablesMutationDeleteLearnedItem(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.deleteFromLearnedItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }
}
