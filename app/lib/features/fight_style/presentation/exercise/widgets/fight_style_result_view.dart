import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/cubit/fight_style_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The calm outcome of the exercise: a description, never a label or a score.
class const FightStyleResultView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.fightStyle;
    final result = context.select((FightStyleCubit cubit) => cubit.state.savedResult);
    final isAdded = context.select((FightStyleCubit cubit) => cubit.state.isInTools);
    final isAdding = context.select((FightStyleCubit cubit) => cubit.state.isAdding);
    final cubit = context.read<FightStyleCubit>();
    if (result == null) return const SizedBox.shrink();

    final description = l10n.descriptions.selectOrFallback(result.topPattern);
    final practice = l10n.practices.selectOrFallback(result.topPattern);
    final partnerName = result.partnerName;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.resultTitle,
              highlight: l10n.resultHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseSurfaceCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BaseTag(text: l10n.patternTag),
                    const Spacer(),
                    const BaseFace(kind: FaceKind.thinking, size: FaceSize.small),
                  ],
                ),
                const SizedBox(height: AppSpace.s14),
                Text(description, style: context.text.titleSm),
                const SizedBox(height: AppSpace.s10),
                Text(
                  practice,
                  style: context.text.body.copyWith(color: context.colors.textSecondary),
                ),
                if (partnerName != null) ...[
                  const SizedBox(height: AppSpace.s8),
                  Text(
                    l10n.partnerSignal(name: partnerName),
                    style: context.text.body.copyWith(color: context.colors.textSecondary),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: isAdded ? l10n.addedToTools : l10n.addToTools,
            isEnabled: !isAdded,
            isLoading: isAdding,
            onPressed: () => cubit.addRepairTool(description),
          ),
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.keepMine,
            variant: .secondary,
            onPressed: () => context.router.maybePop(),
          ),
        ],
      ),
    );
  }
}
