import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/cubit/milestone_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const MilestoneFormCard({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final colors = context.colors;
    final state = context.select((MilestoneCubit cubit) => cubit.state);
    final cubit = context.read<MilestoneCubit>();

    final displayTitle = state.title.value.trim().isEmpty
        ? (state.isEditing ? l10n.milestoneDetailTitle : l10n.milestoneNewTitle)
        : state.title.value.trim();

    final hasPlace = state.place.value.trim().isNotEmpty || state.kind == MilestoneKind.trip;
    final formattedDate = HistoryDateFormatter.formatMilestoneDate(
      l10n,
      date: state.date,
      precision: state.precision,
    );
    final authorLabel = (state.existing != null && !state.existing!.isMine)
        ? (state.existing!.authorName ?? l10n.partnerFallback)
        : l10n.addedByYou;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppWashSurface(
          wash: AppWash.hero,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.card),
                border: AppBorders.hair(colors.borderDefault),
              ),
              child: Center(
                child: AppIcon(
                  icon: hasPlace ? AppIcons.map_pin : AppIcons.image,
                  size: AppIconSize.xl,
                  color: colors.accentLabel,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s18),
        AppHighlightedText(
          text: displayTitle,
          highlight: _resolveHighlight(displayTitle, l10n.milestoneDefaultHighlight),
          style: context.text.titleXl.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseListGroup(
          children: [
            BaseListTile(title: l10n.dateRowLabel, value: formattedDate),
            BaseListTile(title: l10n.addedByRowLabel, value: authorLabel),
            BaseListTile(
              title: l10n.visibilityRowLabel,
              value: state.isShared ? l10n.visibilityBoth : l10n.visibilityOnlyYou,
              trailing: AppIcon(icon: AppIcons.lock, size: AppIconSize.xs, color: colors.iconMuted),
              showsChevron: true,
              onTap: cubit.toggleVisibility,
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s20),
        BaseTextField(
          text: state.title.value,
          label: l10n.milestoneTitleLabel,
          hint: l10n.milestoneTitleHint,
          errorText: l10n.milestoneTitleErrors.selectOrNull(state.title.errorName),
          onChanged: cubit.onTitleChanged,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextField(
          text: state.place.value,
          label: l10n.milestonePlaceLabel,
          hint: l10n.milestonePlaceHint,
          errorText: l10n.milestonePlaceErrors.selectOrNull(state.place.errorName),
          onChanged: cubit.onPlaceChanged,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextArea(
          text: state.body.value,
          hint: l10n.milestoneBodyHint,
          maxLength: milestoneBodyMaxLength,
          maxLines: 3,
          errorText: l10n.milestoneBodyErrors.selectOrNull(state.body.errorName),
          onChanged: cubit.onBodyChanged,
        ),
        const SizedBox(height: AppSpace.s16),
        Text(
          l10n.milestoneKindLabel,
          style: context.text.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            BaseChoiceChip(
              label: l10n.kindFirst,
              icon: AppIcons.heart_filled,
              isSelected: state.kind == MilestoneKind.first,
              onTap: () => cubit.onKindSelected(MilestoneKind.first),
            ),
            BaseChoiceChip(
              label: l10n.kindTrip,
              icon: AppIcons.map_pin,
              isSelected: state.kind == MilestoneKind.trip,
              onTap: () => cubit.onKindSelected(MilestoneKind.trip),
            ),
            BaseChoiceChip(
              label: l10n.kindHome,
              icon: AppIcons.home,
              isSelected: state.kind == MilestoneKind.home,
              onTap: () => cubit.onKindSelected(MilestoneKind.home),
            ),
            BaseChoiceChip(
              label: l10n.kindCustom,
              icon: AppIcons.sparkle,
              isSelected:
                  state.kind == MilestoneKind.custom ||
                  state.kind == MilestoneKind.met ||
                  state.kind == MilestoneKind.dating ||
                  state.kind == MilestoneKind.engaged ||
                  state.kind == MilestoneKind.married,
              onTap: () => cubit.onKindSelected(MilestoneKind.custom),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s16),
        Text(
          l10n.dateRowLabel,
          style: context.text.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            BaseChoiceChip(
              label: l10n.precisionDay,
              isSelected: state.precision == MilestoneDatePrecision.day,
              onTap: () => cubit.onPrecisionSelected(MilestoneDatePrecision.day),
            ),
            BaseChoiceChip(
              label: l10n.precisionMonth,
              isSelected: state.precision == MilestoneDatePrecision.month,
              onTap: () => cubit.onPrecisionSelected(MilestoneDatePrecision.month),
            ),
            BaseChoiceChip(
              label: l10n.precisionYear,
              isSelected: state.precision == MilestoneDatePrecision.year,
              onTap: () => cubit.onPrecisionSelected(MilestoneDatePrecision.year),
            ),
            BaseChoiceChip(
              label: l10n.unknownDateToggle,
              isSelected: state.precision == MilestoneDatePrecision.unknown,
              onTap: () => cubit.onPrecisionSelected(MilestoneDatePrecision.unknown),
            ),
          ],
        ),
        if (!state.isUnknownDate) ...[
          const SizedBox(height: AppSpace.s12),
          BaseDateField(
            value: state.date ?? clock.now(),
            label: l10n.dateRowLabel,
            formatter: (date) => HistoryDateFormatter.formatMilestoneDate(
              l10n,
              date: date,
              precision: state.precision,
            ),
            onChanged: cubit.onDateChanged,
          ),
        ],
      ],
    );
  }

  static String _resolveHighlight(String title, String preferredWord) {
    if (title.contains(preferredWord)) return preferredWord;
    final words = title.split(' ');
    return words.isEmpty ? '' : words.last;
  }
}
