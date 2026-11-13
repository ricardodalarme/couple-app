import 'package:flutter_bloc_starter/features/notes/data/data_sources/remote/mutations/generated/DeletePartnerMessage.graphql.dart';
import 'package:flutter_bloc_starter/features/notes/data/data_sources/remote/mutations/generated/SendPartnerMessage.graphql.dart';
import 'package:flutter_bloc_starter/features/notes/data/data_sources/remote/queries/generated/SentPartnerMessages.graphql.dart';
import 'package:network/network.dart';

class NotesDataSource({required final GQLClient _client}) {
  Future<List<QuerySentPartnerMessagespartnerMessagesCollectionedgesnode>> getSent(
    String senderId,
  ) async {
    final response = await _client.query(
      OptionsQuerySentPartnerMessages(
        variables: VariablesQuerySentPartnerMessages(senderId: senderId),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    final edges = validateResponseData(
      response,
      getData: (data) => data.partnerMessagesCollection.edges,
    );

    return [for (final edge in edges) edge.node];
  }

  Future<void> send({
    required String kind,
    required bool forWidget,
    String? body,
    String? mediaPath,
  }) async {
    final response = await _client.mutate(
      OptionsMutationSendPartnerMessage(
        variables: VariablesMutationSendPartnerMessage(
          kind: kind,
          body: body,
          mediaPath: mediaPath,
          forWidget: forWidget,
        ),
      ),
    );

    validateResponse(response);
  }

  /// Whether the server removed the row; `false` means it was already gone.
  Future<bool> delete(String id) async {
    final response = await _client.mutate(
      OptionsMutationDeletePartnerMessage(
        variables: VariablesMutationDeletePartnerMessage(messageId: id),
      ),
    );

    return validateResponseData(response, getData: (data) => data.deletePartnerMessage ?? false);
  }
}
