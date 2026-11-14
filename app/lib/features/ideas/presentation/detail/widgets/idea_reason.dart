import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/ideas/presentation/detail/cubit/idea_detail_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Why this idea is shown: the person's phase and first goal, as they chose them.
class const IdeaReason({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.ideaDetail;
    final phase = context.select((IdeaDetailCubit cubit) => cubit.state.phase);
    final goals = context.select((IdeaDetailCubit cubit) => cubit.state.goals);
    final phaseLabel = phase == null
        ? null
        : context.l10n.intro.phase.options.selectOrFallback(phase.name);
    final goalLabel = goals.isEmpty
        ? null
        : context.l10n.intro.goals.options.selectOrFallback(goals.first.name);
    if ((phaseLabel ?? '').isEmpty && (goalLabel ?? '').isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.whyTitle),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            if ((phaseLabel ?? '').isNotEmpty)
              BaseListTile(title: l10n.yourPhase, value: phaseLabel),
            if ((goalLabel ?? '').isNotEmpty) BaseListTile(title: l10n.yourGoal, value: goalLabel),
          ],
        ),
      ],
    );
  }
}
