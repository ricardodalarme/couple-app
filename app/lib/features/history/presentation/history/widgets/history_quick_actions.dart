import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HistoryQuickActions({
  required final VoidCallback onStoryDatesTap,
  required final VoidCallback onNumbersTap,
  required final VoidCallback onVariationsTap,
  required final VoidCallback onAvatarTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;

    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = math.min(
          constraints.maxWidth - 2 * AppSpace.screenMargin,
          AppSpace.maxContentWidth,
        );
        final columnInset = (constraints.maxWidth - columnWidth) / 2;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: columnInset),
          child: Row(
            spacing: AppSpace.s8,
            children: [
              BaseChoiceChip(
                label: l10n.storyDatesAction,
                icon: AppIcons.calendar,
                onTap: onStoryDatesTap,
              ),
              BaseChoiceChip(
                label: l10n.numbersAction,
                icon: AppIcons.sparkle,
                onTap: onNumbersTap,
              ),
              BaseChoiceChip(
                label: l10n.variationsAction,
                icon: AppIcons.heart,
                onTap: onVariationsTap,
              ),
              BaseChoiceChip(label: l10n.avatarAction, icon: AppIcons.user, onTap: onAvatarTap),
            ],
          ),
        );
      },
    );
  }
}
