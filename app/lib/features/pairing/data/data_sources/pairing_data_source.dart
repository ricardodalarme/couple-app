import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/CancelInvite.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/CreateInvite.graphql.dart';
import 'package:network/network.dart';

class PairingDataSource({required final GQLClient _client}) {
  Future<MutationCreateInvitecreateInvite> createInvite() async {
    final response = await _client.mutate(OptionsMutationCreateInvite());

    return validateResponseData(response, getData: (data) => data.createInvite);
  }

  Future<void> cancelInvite(String inviteId) async {
    final response = await _client.mutate(
      OptionsMutationCancelInvite(variables: VariablesMutationCancelInvite(inviteId: inviteId)),
    );

    validateResponse(response);
  }
}
