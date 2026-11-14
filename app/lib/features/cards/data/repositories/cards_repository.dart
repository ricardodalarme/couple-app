import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/data_sources/remote/cards_data_source.dart';
import 'package:flutter_bloc_starter/features/cards/data/mappers/card_mapper.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:logger/logger.dart';

/// How many cards one page of the history holds.
const int cardPageSize = 20;

class CardsRepository({
  required final CardsDataSource _dataSource,
  final WidgetsRepository? _widgetsRepository,
}) {
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

  /// One page of the sent and received cards, newest first.
  Future<CardSummaryPage> getHistory({String? after}) async {
    try {
      final result = await _dataSource.getCards(first: cardPageSize, after: after);

      return CardSummaryPage(
        items: [
          for (final edge in result.edges)
            CardSummary(
              id: edge.node.id,
              isMine: edge.node.isMine ?? false,
              sentAt: edge.node.sentAt ?? edge.node.weekStart,
              itemCount: edge.node.items?.edges.length ?? 0,
              reaction: edge.node.reaction?.reaction,
              hasReply: (edge.node.reaction?.reply ?? '').isNotEmpty,
              isOpened: edge.node.open != null,
            ),
        ],
        hasNext: result.pageInfo.hasNextPage,
        cursor: result.pageInfo.endCursor,
      );
    } catch (e, stack) {
      _logger.error('Failed to load the card history', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// One card with its author and the answer, or a not-found failure.
  Future<CardDetail> getDetail({required String id}) async {
    try {
      final node = await _dataSource.getCard(id);
      if (node == null) throw const LocalizedException(l10nKey: 'CARD_NOT_FOUND');

      return CardDetail(
        card: node.toModel(),
        isMine: node.isMine ?? false,
        authorName: node.author?.displayName,
        recipientName: node.recipient?.displayName,
        reaction: node.reaction?.reaction,
        reply: node.reaction?.reply,
      );
    } catch (e, stack) {
      _logger.error('Failed to load the card', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Records that the recipient opened the card, so the sender sees it when receipts are on.
  Future<void> markRead(String cardId) async {
    try {
      await _dataSource.markRead(cardId);
      unawaited(_widgetsRepository?.syncQuietly());
    } catch (e, stack) {
      _logger.error('Failed to mark the card as read', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sets the recipient's one reaction to the card.
  Future<String?> react({required String cardId, required String reaction, String? reply}) async {
    try {
      final result = await _dataSource.react(cardId: cardId, reaction: reaction, reply: reply);
      unawaited(_widgetsRepository?.syncQuietly());
      return result;
    } catch (e, stack) {
      _logger.error('Failed to react to the card', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the card to the connected partner. Sending a card that was already sent is safe:
  /// the server rejects it and the caller reads the card again.
  Future<SundayCard> send(String cardId) async {
    try {
      final model = (await _dataSource.sendCard(cardId)).toModel();
      unawaited(_widgetsRepository?.syncQuietly());
      return model;
    } catch (e, stack) {
      _logger.error('Failed to send the card', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Keeps the card for later; nothing is lost and it can still be sent.
  Future<SundayCard> hold(String cardId) async {
    try {
      final model = (await _dataSource.holdCard(cardId)).toModel();
      unawaited(_widgetsRepository?.syncQuietly());
      return model;
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
