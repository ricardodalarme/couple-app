import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HistoryStatsRow({
  required final HistoryNumbers numbers,
  required final VoidCallback onNumbersTap,
  required final VoidCallback onStoryDatesTap,
  required final VoidCallback onVariationsTap,
  required final VoidCallback onAvatarTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final showPlacesInThirdSlot = numbers.placesCount > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          spacing: AppSpace.s8,
          children: [
            Expanded(
              child: _StatTile(
                value: numbers.daysTogether.toString(),
                label: l10n.statDays(count: numbers.daysTogether),
                onTap: onNumbersTap,
              ),
            ),
            Expanded(
              child: _StatTile(
                value: numbers.weekendsTogether.toString(),
                label: l10n.statWeekends(count: numbers.weekendsTogether),
                onTap: onNumbersTap,
              ),
            ),
            Expanded(
              child: _StatTile(
                value: showPlacesInThirdSlot
                    ? numbers.placesCount.toString()
                    : numbers.christmasesTogether.toString(),
                label: showPlacesInThirdSlot
                    ? l10n.statPlaces(count: numbers.placesCount)
                    : l10n.statChristmases(count: numbers.christmasesTogether),
                onTap: onNumbersTap,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
        ),
      ],
    );
  }
}

class const _StatTile({
  required final String value,
  required final String label,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.xxl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.s8, vertical: AppSpace.s14),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          border: AppBorders.hair(colors.borderDefault),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              style: text.titleMd.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(height: AppSpace.s2),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: text.micro.copyWith(color: colors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
