import 'package:flutter_bloc_starter/features/cards/data/data_sources/fragments/generated/CardFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/mutations/generated/HoldCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/mutations/generated/PrepareCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/mutations/generated/SendCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/mutations/generated/UpdateCardDraft.graphql.dart';
import 'package:network/network.dart';

class CardsDataSource({required final GQLClient _client}) {
  /// Builds this week's draft from the week's slips, or returns the one that already exists.
  Future<FragmentCardFragment> prepareCard() async {
    final response = await _client.mutate(OptionsMutationPrepareCard());

    return validateResponseData(response, getData: (data) => data.prepareCard);
  }

  Future<FragmentCardFragment> sendCard(String cardId) async {
    final response = await _client.mutate(
      OptionsMutationSendCard(variables: VariablesMutationSendCard(cardId: cardId)),
    );

    return validateResponseData(response, getData: (data) => data.sendCard);
  }

  Future<FragmentCardFragment> holdCard(String cardId) async {
    final response = await _client.mutate(
      OptionsMutationHoldCard(variables: VariablesMutationHoldCard(cardId: cardId)),
    );

    return validateResponseData(response, getData: (data) => data.holdCard);
  }

  Future<FragmentCardFragment> updateDraft({
    required String cardId,
    required List<String> slipIds,
    String? note,
  }) async {
    final response = await _client.mutate(
      OptionsMutationUpdateCardDraft(
        variables: VariablesMutationUpdateCardDraft(cardId: cardId, slipIds: slipIds, note: note),
      ),
    );

    return validateResponseData(response, getData: (data) => data.updateCardDraft);
  }
}
