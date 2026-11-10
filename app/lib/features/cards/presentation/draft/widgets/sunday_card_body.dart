import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/draft/cubit/sunday_card_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/card_view.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// The draft card, either to read or to change.
class const SundayCardBody({required final SundayCard card, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.sundayCard;
    final draft = context.select((SundayCardCubit cubit) => cubit.state.draft);
    final selfName = context.select((SundayCardCubit cubit) => cubit.state.selfName);
    final partnerName = context.select((SundayCardCubit cubit) => cubit.state.partnerName);
    final isSaving = context.select((SundayCardCubit cubit) => cubit.state.saveAction.isLoading);
    final cubit = context.read<SundayCardCubit>();
    final shown = draft ?? card;

    if (shown.items.isEmpty && draft == null) {
      return BaseEmptyState(
        title: l10n.emptyTitle,
        text: l10n.emptyText,
        actionText: l10n.emptyAction,
        onAction: () => context.router.root.push(const QuickSlipRoute()),
      );
    }

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardView(
            card: shown,
            fromName: selfName,
            toName: partnerName,
            itemTrailing: draft == null
                ? null
                : (context, index) => _ItemActions(index: index, count: shown.items.length),
          ),
          if (draft != null) ...[
            const SizedBox(height: AppSpace.s16),
            BaseTextArea(
              text: draft.note,
              hint: l10n.noteHint,
              maxLength: cardNoteMaxLength,
              maxLines: 3,
              onChanged: cubit.onNoteChanged,
            ),
          ],
        ],
      ),
      footer: draft == null
          ? (card.isDraft
                ? BaseButton(text: l10n.edit, variant: .secondary, onPressed: cubit.startEditing)
                : null)
          : Row(
              children: [
                BaseButton(
                  text: l10n.cancel,
                  variant: .text,
                  isFullWidth: false,
                  onPressed: cubit.cancelEditing,
                ),
                const SizedBox(width: AppSpace.s12),
                Expanded(
                  child: BaseButton(text: l10n.save, isLoading: isSaving, onPressed: cubit.save),
                ),
              ],
            ),
    );
  }
}

class const _ItemActions({required final int index, required final int count})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.sundayCard;
    final cubit = context.read<SundayCardCubit>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index > 0)
          BaseRoundButton(
            icon: AppIcons.chevron_up,
            semanticLabel: l10n.moveUp,
            onPressed: () => cubit.moveItem(index, -1),
          ),
        if (index < count - 1)
          BaseRoundButton(
            icon: AppIcons.chevron_down,
            semanticLabel: l10n.moveDown,
            onPressed: () => cubit.moveItem(index, 1),
          ),
        BaseRoundButton(
          icon: AppIcons.close,
          semanticLabel: l10n.remove,
          onPressed: () => cubit.removeItem(index),
        ),
      ],
    );
  }
}
