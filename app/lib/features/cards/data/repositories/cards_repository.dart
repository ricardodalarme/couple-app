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
