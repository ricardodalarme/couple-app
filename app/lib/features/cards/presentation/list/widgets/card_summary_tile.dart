import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// One row of the card history: the date, how many slips, and what the other person did.
class const CardSummaryTile({required final CardSummary card, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardsList;
    final date = card.sentAt.toLocal();
    final status = card.hasReply
        ? l10n.replied
        : card.reaction != null
        ? l10n.reacted
        : card.isOpened
        ? l10n.opened
        : null;
    final parts = [l10n.slipCount(count: card.itemCount), ?status];

    return BaseListTile(
      title: l10n.dateShort(day: date.day, month: l10n.monthsShort[date.month - 1]),
      subtitle: parts.join(' · '),
      value: card.isMine ? l10n.sent : l10n.received,
      showsChevron: true,
      onTap: () => context.pushRoute(CardDetailRoute(cardId: card.id)),
    );
  }
}
