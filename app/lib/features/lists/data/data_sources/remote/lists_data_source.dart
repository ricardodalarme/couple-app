import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/fragments/generated/ListItemFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/AddListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/CreateList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/DeleteList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/DeleteListItem.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/RenameList.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/ReorderListItems.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/SetListItemStatus.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/mutations/generated/SetListVisibility.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/queries/generated/ListDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/queries/generated/Lists.graphql.dart';
import 'package:network/network.dart';

class ListsDataSource({required final GQLClient _client}) {
  Future<List<FragmentListFragment>> getLists() async {
    final response = await _client.query(OptionsQueryLists(fetchPolicy: FetchPolicy.networkOnly));
    final edges = validateResponseData(response, getData: (data) => data.listsCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  /// The list and its items, or null when the list is no longer visible.
  Future<QueryListDetaillistsByPk?> getList(String id) async {
    final response = await _client.query(
      OptionsQueryListDetail(
        variables: VariablesQueryListDetail(id: id),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    validateResponse(response);

    return response.parsedData?.listsByPk;
  }

  Future<FragmentListFragment> createList({
    required String id,
    required String title,
    required EnumListKind kind,
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

    return validateResponseData(
      response,
      getData: (data) => data.insertIntoListsCollection?.records.firstOrNull,
    );
  }

  Future<FragmentListFragment> renameList({required String id, required String title}) async {
    final response = await _client.mutate(
      OptionsMutationRenameList(
        variables: VariablesMutationRenameList(id: id, title: title),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateListsCollection.records.firstOrNull,
    );
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

  Future<FragmentListFragment> setListVisibility({required String id, String? coupleId}) async {
    final response = await _client.mutate(
      OptionsMutationSetListVisibility(
        // fromJson keeps `coupleId` in the payload even when null; the generated
        // constructor drops a null variable, which turns the update into a no-op.
        variables: VariablesMutationSetListVisibility.fromJson({'id': id, 'coupleId': coupleId}),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateListsCollection.records.firstOrNull,
    );
  }

  Future<FragmentListItemFragment> addItem({
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

    return validateResponseData(
      response,
      getData: (data) => data.insertIntoListItemsCollection?.records.firstOrNull,
    );
  }

  Future<FragmentListItemFragment> setItemStatus({
    required String id,
    required EnumListItemStatus status,
  }) async {
    final response = await _client.mutate(
      OptionsMutationSetListItemStatus(
        variables: VariablesMutationSetListItemStatus(id: id, status: status),
      ),
    );

    return validateResponseData(
      response,
      getData: (data) => data.updateListItemsCollection.records.firstOrNull,
    );
  }

  /// Sets each item's position to its index in [itemIds] and returns the whole list in order.
  Future<List<FragmentListItemFragment>> reorderItems({
    required String listId,
    required List<String> itemIds,
  }) async {
    final response = await _client.mutate(
      OptionsMutationReorderListItems(
        variables: VariablesMutationReorderListItems(listId: listId, itemIds: itemIds),
      ),
    );
    final edges = validateResponseData(response, getData: (data) => data.reorderListItems?.edges);

    return [for (final edge in edges) edge.node];
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
