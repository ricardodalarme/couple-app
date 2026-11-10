import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/card_reaction_labels.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The four one-tap reactions for a card the person just received.
class const CardReactionSection({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardsList;
    final reaction = context.select((CardDetailCubit cubit) => cubit.state.reaction);
    final isSaving = context.select(
      (CardDetailCubit cubit) => cubit.state.reactionAction.isLoading,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.reactionPrompt),
        const SizedBox(height: AppSpace.s12),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final item in CardReaction.values)
              BaseChoiceChip(
                label: l10n.labelFor(item),
                isSelected: reaction == item.value,
                onTap: isSaving ? null : () => context.read<CardDetailCubit>().toggleReaction(item),
              ),
          ],
        ),
      ],
    );
  }
}
