import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/AddListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/CreateList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/DeleteList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/DeleteListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/RenameList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/SetListItemPosition.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/SetListItemStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/mutations/generated/SetListVisibility.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/queries/generated/ListDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/queries/generated/Lists.graphql.dart';
import 'package:network/network.dart';

class ListsDataSource({required final GQLClient _client}) {
  Future<List<QueryListslistsCollectionedgesnode>> getLists() async {
    final response = await _client.query(OptionsQueryLists(fetchPolicy: FetchPolicy.networkOnly));
    final edges = validateResponseData(response, getData: (data) => data.listsCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  /// The list and its items, or null when the list is no longer visible.
  Future<QueryListDetaillistsCollectionedgesnode?> getList(String id) async {
    final response = await _client.query(
      OptionsQueryListDetail(
        variables: VariablesQueryListDetail(id: id),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(response, getData: (data) => data.listsCollection.edges);

    return edges.firstOrNull?.node;
  }

  Future<void> createList({
    required String id,
    required String title,
    required String kind,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationCreateList(
        variables: VariablesMutationCreateList(
          id: id,
          title: title,
          kind: kind,
          coupleId: coupleId,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> renameList({required String id, required String title}) async {
    final response = await _client.mutate(
      OptionsMutationRenameList(
        variables: VariablesMutationRenameList(id: id, title: title),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateListsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> deleteList(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteList(variables: VariablesMutationDeleteList(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.deleteFromListsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> setListVisibility({required String id, String? coupleId}) async {
    final response = await _client.mutate(
      OptionsMutationSetListVisibility(
        variables: VariablesMutationSetListVisibility(id: id, coupleId: coupleId),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateListsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> addItem({
    required String id,
    required String listId,
    required String title,
    required int position,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddListItem(
        variables: VariablesMutationAddListItem(
          id: id,
          listId: listId,
          title: title,
          position: position,
        ),
      ),
    );

    validateResponse(response);
  }

  Future<void> setItemStatus({required String id, required String status}) async {
    final response = await _client.mutate(
      OptionsMutationSetListItemStatus(
        variables: VariablesMutationSetListItemStatus(id: id, status: status),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateListItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> setItemPosition({required String id, required int position}) async {
    final response = await _client.mutate(
      OptionsMutationSetListItemPosition(
        variables: VariablesMutationSetListItemPosition(id: id, position: position),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateListItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> deleteItem(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteListItem(variables: VariablesMutationDeleteListItem(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.deleteFromListItemsCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }
}
