import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/mutations/generated/InsertLoveStyleManualEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/mutations/generated/InsertLoveStyleResult.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/mutations/generated/ShareLoveStyle.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/mutations/generated/UpdateLoveStyleManualEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/mutations/generated/UpdateLoveStyleResult.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/queries/generated/LoveStyleManualEntry.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/queries/generated/LoveStyleResult.graphql.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/queries/generated/LoveStyleSharedMessage.graphql.dart';
import 'package:network/network.dart';

/// A saved love-style result with its row id, before the domain mapping.
typedef LoveStyleRecord = ({String id, List<String> ranked});

/// A saved manual entry with its row id, before the domain mapping.
typedef ManualEntryRecord = ({String id, String value});

class LoveStyleDataSource({required final GQLClient _client}) {
  Future<LoveStyleRecord?> getResult() async {
    final response = await _client.query(
      OptionsQueryLoveStyleResult(fetchPolicy: FetchPolicy.networkOnly),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.quizResultsCollection.edges,
    );
    final node = edges.firstOrNull?.node;

    return node == null ? null : (id: node.id, ranked: node.ranked.whereType<String>().toList());
  }

  Future<void> insertResult(List<String> ranked) async {
    final response = await _client.mutate(
      OptionsMutationInsertLoveStyleResult(
        variables: VariablesMutationInsertLoveStyleResult(ranked: ranked.cast<String?>()),
      ),
    );

    validateResponseData(
      response,
      getData: (data) => data.insertIntoQuizResultsCollection?.records.firstOrNull,
    );
  }

  Future<void> updateResult({required String id, required List<String> ranked}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateLoveStyleResult(
        variables: VariablesMutationUpdateLoveStyleResult(id: id, ranked: ranked.cast<String?>()),
      ),
    );
    final affectedCount = validateResponseData(
      response,
      getData: (data) => data.updateQuizResultsCollection.affectedCount,
    );
    if (affectedCount == 0) throw const NoDataException();
  }

  Future<ManualEntryRecord?> getManualEntry(String authorId) async {
    final response = await _client.query(
      OptionsQueryLoveStyleManualEntry(
        variables: VariablesQueryLoveStyleManualEntry(authorId: authorId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.manualEntriesCollection.edges,
    );
    final node = edges.firstOrNull?.node;

    return node == null ? null : (id: node.id, value: node.value);
  }

  Future<void> insertManualEntry(String value) async {
    final response = await _client.mutate(
      OptionsMutationInsertLoveStyleManualEntry(
        variables: VariablesMutationInsertLoveStyleManualEntry(value: value),
      ),
    );

    validateResponseData(
      response,
      getData: (data) => data.insertIntoManualEntriesCollection?.records.firstOrNull,
    );
  }

  Future<void> updateManualEntry({required String id, required String value}) async {
    final response = await _client.mutate(
      OptionsMutationUpdateLoveStyleManualEntry(
        variables: VariablesMutationUpdateLoveStyleManualEntry(id: id, value: value),
      ),
    );
    final affectedCount = validateResponseData(
      response,
      getData: (data) => data.updateManualEntriesCollection.affectedCount,
    );
    if (affectedCount == 0) throw const NoDataException();
  }

  /// Sends the short description as a note and returns the stored message id.
  Future<String> shareMessage(String body) async {
    final response = await _client.mutate(
      OptionsMutationShareLoveStyle(variables: VariablesMutationShareLoveStyle(body: body)),
    );
    return validateResponseData(response, getData: (data) => data.sendPartnerMessage?.id);
  }

  /// Whether the sender still has a message with [id], so a stored share can be trusted.
  Future<bool> sharedMessageExists(String id) async {
    final response = await _client.query(
      OptionsQueryLoveStyleSharedMessage(
        variables: VariablesQueryLoveStyleSharedMessage(id: id),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.partnerMessagesCollection.edges,
    );

    return edges.isNotEmpty;
  }

  /// Deletes one of the person's own notes through the sender-only RPC.
  ///
  /// Returns `false` when the row was already gone.
  Future<bool> revokeShare(String id) async {
    final document = parseString(r'''
      mutation RevokeLoveStyleShare($messageId: UUID!) {
        deletePartnerMessage(messageId: $messageId)
      }
    ''');
    final response = await _client.mutate(
      MutationOptions<Map<String, dynamic>>(
        document: document,
        operationName: 'RevokeLoveStyleShare',
        variables: {'messageId': id},
        parserFn: (data) => data,
      ),
    );

    return validateResponseData<Map<String, dynamic>, bool>(
      response,
      getData: (data) => data['deletePartnerMessage'] as bool?,
    );
  }
}
