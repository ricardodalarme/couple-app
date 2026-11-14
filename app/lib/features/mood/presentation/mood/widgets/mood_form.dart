import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/mood_faces.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const MoodForm({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.mood;
    final mood = context.select((MoodCubit cubit) => cubit.state.mood);
    final need = context.select((MoodCubit cubit) => cubit.state.need);
    final share = context.select((MoodCubit cubit) => cubit.state.share);
    final partnerName = context.select((MoodCubit cubit) => cubit.state.partnerName);
    final canSave = context.select((MoodCubit cubit) => cubit.state.canSave);
    final isSaving = context.select((MoodCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<MoodCubit>();
    final shareTitle = partnerName == null || partnerName.isEmpty
        ? l10n.shareTitle
        : l10n.shareTitleNamed(name: partnerName);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.title,
              highlight: l10n.titleHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.subtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          _MoodGrid(selected: mood, isEnabled: !isSaving, onSelected: cubit.selectMood),
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.needTitle),
          const SizedBox(height: AppSpace.s10),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final option in NeedKind.values)
                BaseChoiceChip(
                  label: l10n.needs.selectOrFallback(option.name),
                  isSelected: need == option,
                  onTap: isSaving ? null : () => cubit.toggleNeed(option),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: shareTitle),
          const SizedBox(height: AppSpace.s4),
          Text(
            l10n.shareSubtitle,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s12),
          Column(
            spacing: AppSpace.s8,
            children: [
              for (final option in MoodShare.values)
                BaseOptionTile(
                  title: l10n.share.selectOrFallback(option.name),
                  support: l10n.shareSupport.selectOrFallback(option.name),
                  isSelected: share == option,
                  isEnabled: !isSaving && (option != MoodShare.moodNeed || need != null),
                  onTap: isSaving ? null : () => cubit.selectShare(option),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s20),
          BaseNote(text: l10n.privacyNote),
        ],
      ),
      footer: BaseButton(
        text: l10n.save,
        isEnabled: canSave,
        isLoading: isSaving,
        onPressed: cubit.save,
      ),
    );
  }
}

class const _MoodGrid({
  required final MoodKind? selected,
  required final bool isEnabled,
  required final ValueChanged<MoodKind> onSelected,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.mood;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth - AppSpace.s8 * 2) / 3;

        return Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final mood in MoodKind.values)
              SizedBox(
                width: width,
                child: _MoodTile(
                  mood: mood,
                  label: l10n.moods.selectOrFallback(mood.name),
                  isSelected: selected == mood,
                  isEnabled: isEnabled,
                  onTap: () => onSelected(mood),
                ),
              ),
          ],
        );
      },
    );
  }
}

class const _MoodTile({
  required final MoodKind mood,
  required final String label,
  required final bool isSelected,
  required final bool isEnabled,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onTap,
      isEnabled: isEnabled,
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(AppRadius.card),
      enforceMinTapTarget: true,
      child: AnimatedContainer(
        duration: context.motionDuration(AppMotion.fast),
        padding: const EdgeInsets.symmetric(vertical: AppSpace.s12),
        decoration: BoxDecoration(
          color: isSelected ? colors.accentSoft : colors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: isSelected
              ? AppBorders.selected(colors.borderSelected)
              : AppBorders.hair(colors.borderDefault),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseFace(kind: mood.face, selected: isSelected, semanticLabel: label),
            const SizedBox(height: AppSpace.s8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: context.text.bodySm.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? colors.accentLabel : colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
