import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/models/reaction_pattern.dart';
import 'package:flutter_bloc_starter/features/fight_style/presentation/exercise/cubit/fight_style_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const FightStyleQuestionView({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.fightStyle;
    final index = context.select((FightStyleCubit cubit) => cubit.state.questionIndex);
    final selected = context.select((FightStyleCubit cubit) => cubit.state.currentAnswer);
    final canContinue = context.select((FightStyleCubit cubit) => cubit.state.canContinue);
    final isLast = context.select((FightStyleCubit cubit) => cubit.state.isLastQuestion);
    final isSaving = context.select((FightStyleCubit cubit) => cubit.state.isSaving);
    final cubit = context.read<FightStyleCubit>();
    final options = [
      l10n.options1,
      l10n.options2,
      l10n.options3,
      l10n.options4,
      l10n.options5,
      l10n.options6,
    ];

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.exerciseTitle,
              highlight: l10n.exerciseHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            l10n.exerciseSubtitle,
            style: context.text.body.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s20),
          BaseStepper(count: fightStyleQuestionCount, currentIndex: index),
          const SizedBox(height: AppSpace.s22),
          Text(
            l10n.questionOf(current: index + 1, total: fightStyleQuestionCount),
            style: context.text.label.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(l10n.questions[index], style: context.text.question),
          const SizedBox(height: AppSpace.s20),
          for (final pattern in reactionOrderFor(index)) ...[
            BaseOptionTile(
              title: options[index].selectOrFallback(pattern),
              isSelected: selected == pattern,
              onTap: isSaving ? null : () => cubit.select(pattern),
            ),
            const SizedBox(height: AppSpace.s8),
          ],
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.privateNote),
        ],
      ),
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BaseButton(
            text: isLast ? l10n.finishAction : l10n.continueAction,
            isEnabled: canContinue,
            isLoading: isSaving,
            onPressed: cubit.next,
          ),
          const SizedBox(height: AppSpace.s6),
          BaseButton.text(
            text: l10n.back,
            onPressed: index == 0 || isSaving ? null : cubit.back,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}
