import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/mutations/generated/CancelAccountDeletion.graphql.dart';
import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/mutations/generated/RequestAccountDeletion.graphql.dart';
import 'package:flutter_bloc_starter/features/account/data/data_sources/remote/queries/generated/MyDeletionRequest.graphql.dart';
import 'package:network/network.dart';

class AccountDataSource({required final GQLClient _client}) {
  /// The pending deletion, or `null` when there is none.
  Future<QueryMyDeletionRequestdeletionRequestsCollectionedgesnode?> getDeletion() async {
    final response = await _client.query(
      OptionsQueryMyDeletionRequest(fetchPolicy: FetchPolicy.networkOnly),
    );
    final data = validateResponseData(response, getData: (data) => data.deletionRequestsCollection);

    return data.edges.firstOrNull?.node;
  }

  Future<MutationRequestAccountDeletionrequestAccountDeletion> requestDeletion() async {
    final response = await _client.mutate(OptionsMutationRequestAccountDeletion());

    return validateResponseData(response, getData: (data) => data.requestAccountDeletion);
  }

  Future<void> cancelDeletion() async {
    final response = await _client.mutate(OptionsMutationCancelAccountDeletion());

    validateResponse(response);
  }
}
