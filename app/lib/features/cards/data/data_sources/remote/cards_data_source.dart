import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/fragments/generated/CardFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/HoldCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/MarkCardRead.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/PrepareCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/ReactToCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/SendCard.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/mutations/generated/UpdateCardDraft.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/queries/generated/CardDetail.graphql.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/queries/generated/MyCards.graphql.dart';
import 'package:network/network.dart';

class CardsDataSource({required final GQLClient _client}) {
  /// Builds this week's draft from the week's slips, or returns the one that already exists.
  Future<FragmentCardFragment> prepareCard() async {
    final response = await _client.mutate(OptionsMutationPrepareCard());

    return validateResponseData(response, getData: (data) => data.prepareCard);
  }

  Future<QueryMyCardscardsCollection> getCards({required int first, String? after}) async {
    final response = await _client.query(
      OptionsQueryMyCards(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: VariablesQueryMyCards(first: first, after: after),
      ),
    );

    return validateResponseData(response, getData: (data) => data.cardsCollection);
  }

  /// The card with [id], or `null` when it is gone or not visible to the person.
  Future<QueryCardDetailcardsByPk?> getCard(String id) async {
    final response = await _client.query(
      OptionsQueryCardDetail(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: VariablesQueryCardDetail(id: id),
      ),
    );
    validateResponse(response);

    return response.parsedData?.cardsByPk;
  }

  Future<void> markRead(String cardId) async {
    final response = await _client.mutate(
      OptionsMutationMarkCardRead(variables: VariablesMutationMarkCardRead(cardId: cardId)),
    );
    validateResponse(response);
  }

  Future<String?> react({required String cardId, required String reaction, String? reply}) async {
    final response = await _client.mutate(
      OptionsMutationReactToCard(
        variables: VariablesMutationReactToCard(cardId: cardId, reaction: reaction, reply: reply),
      ),
    );

    return validateResponseData(response, getData: (data) => data.reactToCard).reaction;
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
