import 'package:flutter_bloc_starter/features/guides/data/data_sources/mutations/generated/InsertConversationPrep.graphql.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/mutations/generated/UpdateConversationPrep.graphql.dart';
import 'package:network/network.dart';

class GuidesDataSource({required final GQLClient _client}) {
  /// Inserts a private preparation and returns the row id.
  Future<String> insertPrep({
    required String id,
    required String guide,
    required String topic,
    required String? notes,
    required String? draft,
  }) async {
    final response = await _client.mutate(
      OptionsMutationInsertConversationPrep(
        variables: VariablesMutationInsertConversationPrep(
          id: id,
          guide: guide,
          topic: topic,
          notes: notes,
          draft: draft,
        ),
      ),
    );
    final record = validateResponseData(
      response,
      getData: (data) => data.insertIntoConversationPrepsCollection?.records.firstOrNull,
    );

    return record.id;
  }

  Future<void> updatePrep({
    required String id,
    required String guide,
    required String topic,
    required String? notes,
    required String? draft,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateConversationPrep(
        variables: VariablesMutationUpdateConversationPrep(
          id: id,
          guide: guide,
          topic: topic,
          notes: notes,
          draft: draft,
        ),
      ),
    );
    final affectedCount = validateResponseData(
      response,
      getData: (data) => data.updateConversationPrepsCollection.affectedCount,
    );
    if (affectedCount == 0) throw const NoDataException();
  }
}
