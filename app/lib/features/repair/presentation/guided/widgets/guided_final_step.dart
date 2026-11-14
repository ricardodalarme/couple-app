import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/guided/cubit/guided_repair_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const GuidedFinalStep({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.repair.guided;
    final feeling = context.select((GuidedRepairCubit cubit) => cubit.state.feeling);
    final followUp = context.select((GuidedRepairCubit cubit) => cubit.state.followUp);
    final isLoading = context.select(
      (GuidedRepairCubit cubit) => cubit.state.completeAction.isLoading,
    );
    final cubit = context.read<GuidedRepairCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.stepOf(current: guidedWrittenSteps + 1, total: guidedWrittenSteps + 1),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.finalTitle,
              highlight: l10n.finalHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s20),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final key in RepairFeeling.values)
                BaseChoiceChip(
                  label: l10n.feelings.selectOrFallback(key.name),
                  isSelected: feeling == key,
                  onTap: () => cubit.onFeelingChosen(key),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s24),
          Text(l10n.followUpTitle, style: context.text.label),
          const SizedBox(height: AppSpace.s8),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final option in FollowUp.values)
                BaseChoiceChip(
                  label: l10n.followUps.selectOrFallback(option.name),
                  isSelected: followUp == option,
                  onTap: () => cubit.onFollowUpChosen(option),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.followUpNote),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(text: l10n.finish, isLoading: isLoading, onPressed: cubit.finish),
          const SizedBox(height: AppSpace.s10),
          BaseButton(text: l10n.back, variant: .secondary, onPressed: cubit.back),
        ],
      ),
    );
  }
}
