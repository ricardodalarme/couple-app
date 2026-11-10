import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/AcceptInvite.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/CancelInvite.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/CreateInvite.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/ResolveSharedItems.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/mutations/generated/Unpair.graphql.dart';
import 'package:flutter_bloc_starter/features/pairing/data/data_sources/queries/generated/MyPartner.graphql.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/fragments/generated/ProfileFragment.graphql.dart';
import 'package:network/network.dart';

class PairingDataSource({required final GQLClient _client}) {
  Future<MutationCreateInvitecreateInvite> createInvite() async {
    final response = await _client.mutate(OptionsMutationCreateInvite());

    return validateResponseData(response, getData: (data) => data.createInvite);
  }

  /// Returns whether the code connected the two people; the server answers `null` for any
  /// code that is unknown, expired, used or the person's own.
  Future<bool> acceptInvite(String code) async {
    final response = await _client.mutate(
      OptionsMutationAcceptInvite(variables: VariablesMutationAcceptInvite(code: code)),
    );
    validateResponse(response);

    return response.parsedData?.acceptInvite != null;
  }

  Future<FragmentProfileFragment?> getMyPartner() async {
    final response = await _client.query(
      OptionsQueryMyPartner(fetchPolicy: FetchPolicy.networkOnly),
    );

    validateResponse(response);

    return response.parsedData?.myPartner;
  }

  Future<void> cancelInvite(String inviteId) async {
    final response = await _client.mutate(
      OptionsMutationCancelInvite(variables: VariablesMutationCancelInvite(inviteId: inviteId)),
    );

    validateResponse(response);
  }

  Future<void> unpair() async {
    final response = await _client.mutate(OptionsMutationUnpair());

    validateResponse(response);
  }

  Future<void> resolveSharedItems({required bool keep}) async {
    final response = await _client.mutate(
      OptionsMutationResolveSharedItems(variables: VariablesMutationResolveSharedItems(keep: keep)),
    );

    validateResponse(response);
  }
}
