import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/features/gifts/presentation/gifts/widgets/cubit/gift_sheet_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// What the gift sheet hands back to the page.
final class const GiftDraft({
  final String title = '',
  final String? note,
  final String? budget,
  final bool isShared = false,
  final bool isDelete = false,
});

/// The sheet that adds or edits one wish.
class const GiftSheet({required final bool hasPartner, final GiftIdea? gift, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GiftSheetCubit()..start(hasPartner: hasPartner, gift: gift),
      child: const _GiftSheetContent(),
    );
  }
}

class const _GiftSheetContent() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.gifts;
    final title = context.select((GiftSheetCubit cubit) => cubit.state.title);
    final note = context.select((GiftSheetCubit cubit) => cubit.state.note);
    final budget = context.select((GiftSheetCubit cubit) => cubit.state.budget);
    final isShared = context.select((GiftSheetCubit cubit) => cubit.state.isShared);
    final isEditing = context.select((GiftSheetCubit cubit) => cubit.state.isEditing);
    final hasPartner = context.select((GiftSheetCubit cubit) => cubit.state.hasPartner);
    final cubit = context.read<GiftSheetCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: title.value,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          errorText: l10n.titleErrors.selectOrNull(title.errorName),
          onChanged: cubit.onTitleChanged,
        ),
        const SizedBox(height: AppSpace.s16),
        BaseTextArea(
          text: note.value,
          hint: l10n.noteHint,
          maxLength: giftNoteMaxLength,
          maxLines: 4,
          hasError: !note.isValid,
          errorText: l10n.noteErrors.selectOrNull(note.errorName),
          onChanged: cubit.onNoteChanged,
        ),
        const SizedBox(height: AppSpace.s16),
        Text(
          l10n.budgetLabel,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            BaseChoiceChip(
              label: l10n.noBudget,
              isSelected: budget == null,
              onTap: () => cubit.onBudgetChanged(null),
            ),
            for (final option in giftBudgets)
              BaseChoiceChip(
                label: l10n.budgets.selectOrFallback(option),
                isSelected: budget == option,
                onTap: () => cubit.onBudgetChanged(option),
              ),
          ],
        ),
        if (!isEditing) ...[
          const SizedBox(height: AppSpace.s16),
          Row(
            children: [
              Expanded(
                child: Text(
                  hasPartner
                      ? (isShared ? l10n.sharedHint : l10n.privateHint)
                      : l10n.sharedNeedsPartner,
                  style: context.text.caption.copyWith(color: context.colors.textSecondary),
                ),
              ),
              if (hasPartner) ...[
                const SizedBox(width: AppSpace.s12),
                BaseSwitch(
                  value: isShared,
                  semanticLabel: isShared ? l10n.shared : l10n.private,
                  onChanged: cubit.onSharedChanged,
                ),
              ],
            ],
          ),
        ],
        const SizedBox(height: AppSpace.s24),
        BaseButton(text: isEditing ? l10n.save : l10n.add, onPressed: () => _save(context)),
        if (isEditing) ...[
          const SizedBox(height: AppSpace.s10),
          BaseButton(
            text: l10n.delete,
            variant: .secondary,
            onPressed: () => Navigator.of(context).pop(const GiftDraft(isDelete: true)),
          ),
        ],
      ],
    );
  }

  void _save(BuildContext context) {
    final draft = context.read<GiftSheetCubit>().submit();
    if (draft == null) return;

    Navigator.of(context).pop(
      GiftDraft(
        title: draft.title,
        note: draft.note,
        budget: draft.budget,
        isShared: draft.isShared,
      ),
    );
  }
}
