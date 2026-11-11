import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// One saved learning, with its review actions while it is still pending.
class const LearnedItemCard({
  required final LearnedItem item,
  final VoidCallback? onConfirm,
  final VoidCallback? onEdit,
  final VoidCallback? onDiscard,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.learned;
    final isPending = item.status == LearnedStatus.pending;

    return BaseSurfaceCard(
      title: l10n.targets.selectOrFallback(item.target.name),
      supportText: item.text,
      child: isPending
          ? Wrap(
              spacing: AppSpace.s16,
              runSpacing: AppSpace.s8,
              children: [
                BaseTextLink(text: l10n.confirm, onPressed: onConfirm),
                BaseTextLink(text: l10n.edit, onPressed: onEdit),
                BaseTextLink(text: l10n.discard, onPressed: onDiscard),
              ],
            )
          : null,
    );
  }
}
