import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'card_detail_state.dart';

/// Reads one card and lets its recipient answer it.
class CardDetailCubit({
  required final CardsRepository _cardsRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<CardDetailState> {
  this : super(const CardDetailState());

  String? _markedCardId;

  Future<void> load(String cardId) async {
    if (state.card is! Success) emit(state.copyWith(card: const Loading()));
    try {
      final selfId = (await _profileRepository.getMyProfile()).id;
      final detail = await _cardsRepository.getDetail(id: cardId, selfId: selfId);
      emit(
        state.copyWith(
          card: Success(detail),
          reaction: detail.reaction,
          clearReaction: detail.reaction == null,
        ),
      );
      await _markReadOnce(cardId, detail);
    } catch (exception) {
      if (state.card is Success) return;
      emit(state.copyWith(card: Failure.fromObject(exception)));
    }
  }

  Future<void> toggleReaction(CardReaction reaction) async {
    final card = state.card;
    if (card is! Success<CardDetail> || card.value.isMine || state.reactionAction.isLoading) return;

    if (state.reaction == reaction.value) return;

    emit(state.copyWith(reactionAction: const Loading()));
    try {
      final saved = await _cardsRepository.react(
        cardId: card.value.card.id,
        reaction: reaction.value,
        reply: card.value.reply,
      );
      emit(
        state.copyWith(
          reaction: saved,
          clearReaction: saved == null,
          reactionAction: const Success(null),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(reactionAction: Failure.fromObject(exception)));
    }
  }

  Future<void> _markReadOnce(String cardId, CardDetail detail) async {
    if (detail.isMine || _markedCardId == cardId) return;

    _markedCardId = cardId;
    try {
      await _cardsRepository.markRead(cardId);
    } on Object {
      _markedCardId = null;
    }
  }
}
