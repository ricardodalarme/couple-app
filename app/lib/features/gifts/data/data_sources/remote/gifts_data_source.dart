import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/AddGiftWish.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/ClearGiftWishBudget.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/ClearGiftWishNote.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/ClearGiftWishVisibility.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/DeleteGiftWish.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/SetGiftWishVisibility.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/mutations/generated/UpdateGiftWish.graphql.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/queries/generated/GiftPage.graphql.dart';
import 'package:network/network.dart';

class GiftsDataSource({required final GQLClient _client}) {
  Future<List<QueryGiftPagegiftIdeasCollectionedgesnode>> getGiftIdeas() async {
    final response = await _client.query(
      OptionsQueryGiftPage(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(response, getData: (data) => data.giftIdeasCollection.edges);

    return [for (final edge in edges) edge.node];
  }

  Future<void> addGiftWish({
    required String id,
    required String title,
    String? note,
    EnumGiftBudget? budget,
    String? coupleId,
  }) async {
    final response = await _client.mutate(
      OptionsMutationAddGiftWish(
        variables: VariablesMutationAddGiftWish(
          id: id,
          title: title,
          note: note,
          budget: budget,
          coupleId: coupleId,
        ),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.insertIntoGiftIdeasCollection?.affectedCount ?? 0,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> updateGiftWish({
    required String id,
    required String title,
    String? note,
    EnumGiftBudget? budget,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateGiftWish(
        variables: VariablesMutationUpdateGiftWish(
          id: id,
          title: title,
          note: note,
          budget: budget,
        ),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
    if (note == null) await _clearNote(id);
    if (budget == null) await _clearBudget(id);
  }

  Future<void> deleteGiftWish(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeleteGiftWish(variables: VariablesMutationDeleteGiftWish(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.deleteFromGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> setGiftWishVisibility({required String id, String? coupleId}) async {
    if (coupleId == null) return _clearVisibility(id);

    final response = await _client.mutate(
      OptionsMutationSetGiftWishVisibility(
        variables: VariablesMutationSetGiftWishVisibility(id: id, coupleId: coupleId),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  /// Clears a value with a literal null, because a null variable would be omitted.
  Future<void> _clearVisibility(String id) async {
    final response = await _client.mutate(
      OptionsMutationClearGiftWishVisibility(
        variables: VariablesMutationClearGiftWishVisibility(id: id),
      ),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> _clearNote(String id) async {
    final response = await _client.mutate(
      OptionsMutationClearGiftWishNote(variables: VariablesMutationClearGiftWishNote(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }

  Future<void> _clearBudget(String id) async {
    final response = await _client.mutate(
      OptionsMutationClearGiftWishBudget(variables: VariablesMutationClearGiftWishBudget(id: id)),
    );
    final affected = validateResponseData(
      response,
      getData: (data) => data.updateGiftIdeasCollection.affectedCount,
    );
    if (affected == 0) throw const NoDataException();
  }
}
