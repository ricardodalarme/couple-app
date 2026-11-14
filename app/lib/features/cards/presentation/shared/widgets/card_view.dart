import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The card as the partner will see it. Shared by the draft, the sent card and previews.
class const CardView({
  required final SundayCard card,
  final String? fromName,
  final String? toName,
  final Widget Function(BuildContext context, int index)? itemTrailing,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardView;
    final note = card.note;
    final to = toName;
    final from = fromName;

    return BaseSurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            to == null ? l10n.forPartnerNoName : l10n.forPartner(name: to),
            style: context.text.label.copyWith(color: context.colors.accentLabel),
          ),
          const SizedBox(height: AppSpace.s6),
          Semantics(
            header: true,
            child: Text(l10n.goodThings(count: card.items.length), style: context.text.titleLg),
          ),
          const SizedBox(height: AppSpace.s16),
          for (var index = 0; index < card.items.length; index++) ...[
            _Item(item: card.items[index], trailing: itemTrailing?.call(context, index)),
            const SizedBox(height: AppSpace.s14),
          ],
          if (note != null && note.isNotEmpty) ...[
            Text(note, style: context.text.hand),
            if (from != null) Text('— $from', style: context.text.hand),
          ],
        ],
      ),
    );
  }
}

class const _Item({required final CardItem item, final Widget? trailing}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardView;
    final writtenAt = item.writtenAt?.toLocal();
    final category = item.category;
    final parts = [
      if (writtenAt != null) l10n.weekdays[writtenAt.weekday - 1],
      if (category != null) l10n.categories.selectOrFallback(category.name),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.body, style: context.text.bodyLg),
              if (parts.isNotEmpty)
                Text(
                  parts.join(' · '),
                  style: context.text.caption.copyWith(color: context.colors.textSecondary),
                ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }
}
