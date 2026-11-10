import 'package:flutter_bloc_starter/features/cards/data/data_sources/cards_data_source.dart';
import 'package:flutter_bloc_starter/features/cards/data/mappers/card_mapper.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:logger/logger.dart';

class CardsRepository({required final CardsDataSource _dataSource}) {
  final Logger _logger = Logger('CardsRepository');

  /// This week's card, creating the draft from the week's slips when there is none yet.
  Future<SundayCard> getDraft() async {
    try {
      final card = (await _dataSource.prepareCard()).toModel();
      if (card.items.isNotEmpty || !card.isDraft) return card;

      // The call that creates the draft answers before its items are readable; asking again
      // returns them.
      return (await _dataSource.prepareCard()).toModel();
    } catch (e, stack) {
      _logger.error('Failed to load the card draft', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the card to the connected partner. Sending a card that was already sent is safe:
  /// the server rejects it and the caller reads the card again.
  Future<SundayCard> send(String cardId) async {
    try {
      return (await _dataSource.sendCard(cardId)).toModel();
    } catch (e, stack) {
      _logger.error('Failed to send the card', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Keeps the card for later; nothing is lost and it can still be sent.
  Future<SundayCard> hold(String cardId) async {
    try {
      return (await _dataSource.holdCard(cardId)).toModel();
    } catch (e, stack) {
      _logger.error('Failed to hold the card', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves which slips the card holds, in order, and its closing note.
  Future<SundayCard> saveDraft(SundayCard card) async {
    try {
      return (await _dataSource.updateDraft(
        cardId: card.id,
        slipIds: [for (final item in card.items) item.slipId],
        note: card.note,
      )).toModel();
    } catch (e, stack) {
      _logger.error('Failed to save the card draft', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
