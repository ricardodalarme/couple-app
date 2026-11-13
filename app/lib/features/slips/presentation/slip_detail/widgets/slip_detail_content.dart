import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_detail/cubit/slip_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const SlipDetailContent({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final slip = context.select((SlipDetailCubit cubit) => cubit.state.current);
    final isEditing = context.select((SlipDetailCubit cubit) => cubit.state.isEditing);
    if (slip == null) return const SizedBox.shrink();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(slip: slip),
          const SizedBox(height: AppSpace.s16),
          if (isEditing) const _EditField() else _Body(slip: slip),
          if (slip.feeling != null && !isEditing) ...[
            const SizedBox(height: AppSpace.s16),
            _Labelled(label: context.l10n.slipDetail.feeling, text: slip.feeling!),
          ],
          if (slip.planNote != null && !isEditing) ...[
            const SizedBox(height: AppSpace.s16),
            _Labelled(label: context.l10n.slipDetail.plan, text: slip.planNote!),
          ],
          const SizedBox(height: AppSpace.s24),
          if (!isEditing) ...[
            _CardSection(slip: slip),
            const SizedBox(height: AppSpace.s12),
            BaseListGroup(
              children: [
                BaseListTile(
                  title: context.l10n.slipDetail.jarTitle,
                  subtitle: context.l10n.slipDetail.jarText,
                  control: BaseSwitch(
                    value: slip.isInJar,
                    semanticLabel: context.l10n.slipDetail.jarTitle,
                    onChanged: (value) => context.read<SlipDetailCubit>().setInJar(value: value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpace.s12),
          ],
          if (slip.wasInCard) BaseNote(text: context.l10n.slipDetail.sentNote),
        ],
      ),
      footer: isEditing ? const _EditActions() : _Actions(slip: slip),
    );
  }
}

class const _Header({required final SlipDetail slip}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipDetail;
    final date = slip.createdAt.toLocal();
    final line = l10n.dateLine(
      weekday: l10n.weekdays[date.weekday - 1],
      day: date.day,
      month: l10n.monthsShort[date.month - 1],
    );

    return Row(
      children: [
        BaseTag(text: l10n.kinds.selectOrFallback(slip.kind)),
        if (slip.isArchived) ...[const SizedBox(width: AppSpace.s8), BaseTag(text: l10n.archived)],
        const Spacer(),
        Text(line, style: context.text.label.copyWith(color: context.colors.textSecondary)),
      ],
    );
  }
}

class const _Body({required final SlipDetail slip}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(header: true, child: Text(slip.body, style: context.text.titleLg));
  }
}

class const _Labelled({required final String label, required final String text})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.text.label.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: AppSpace.s4),
        Text(text, style: context.text.body),
      ],
    );
  }
}

class const _EditField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = context.select((SlipDetailCubit cubit) => cubit.state.draftBody);

    return BaseTextArea(
      text: text.value,
      maxLength: slipKindMaxLength,
      errorText: context.l10n.slipDetail.draftBodyErrors.selectOrNull(text.errorName),
      hasError: text.errorName != null,
      onChanged: context.read<SlipDetailCubit>().onBodyChanged,
    );
  }
}

class const _CardSection({required final SlipDetail slip}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipDetail;
    final isBusy = context.select((SlipDetailCubit cubit) => cubit.state.saveAction.isLoading);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseSectionHeader(title: l10n.cardTitle),
        const SizedBox(height: AppSpace.s8),
        if (!slip.canGoInCard)
          BaseNote(text: l10n.cardInvisible)
        else ...[
          BaseListGroup(
            children: [
              BaseListTile(
                title: slip.forCard ? l10n.cardOn : l10n.cardOff,
                subtitle: slip.forCard ? l10n.cardOnText : l10n.cardOffText,
                isEnabled: !isBusy,
                control: BaseSwitch(
                  value: slip.forCard,
                  semanticLabel: l10n.cardOn,
                  onChanged: (value) => context.read<SlipDetailCubit>().setForCard(value: value),
                ),
              ),
            ],
          ),
          if (slip.forCard) ...[
            const SizedBox(height: AppSpace.s16),
            Text(l10n.previewTitle, style: context.text.label),
            const SizedBox(height: AppSpace.s4),
            Text(
              l10n.previewText,
              style: context.text.caption.copyWith(color: context.colors.textSecondary),
            ),
            const SizedBox(height: AppSpace.s8),
            BaseSurfaceCard(
              style: .ring,
              padding: const EdgeInsets.all(AppSpace.s16),
              child: Text(slip.body, style: context.text.bodyLg),
            ),
          ],
        ],
      ],
    );
  }
}

class const _Actions({required final SlipDetail slip}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipDetail;
    final cubit = context.read<SlipDetailCubit>();
    final isDeleting = context.select(
      (SlipDetailCubit cubit) => cubit.state.deleteAction.isLoading,
    );
    final isBusy = context.select((SlipDetailCubit cubit) => cubit.state.saveAction.isLoading);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseButton(text: l10n.edit, onPressed: cubit.startEditing),
        const SizedBox(height: AppSpace.s10),
        Row(
          children: [
            Expanded(
              child: BaseButton(
                text: slip.isArchived ? l10n.restore : l10n.archive,
                variant: .secondary,
                isLoading: isBusy,
                onPressed: cubit.toggleArchive,
              ),
            ),
            const SizedBox(width: AppSpace.s10),
            Expanded(
              child: BaseButton(
                text: l10n.delete,
                variant: .secondary,
                isLoading: isDeleting,
                onPressed: () => _confirmDelete(context),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final l10n = context.l10n.slipDetail;
    final cubit = context.read<SlipDetailCubit>();
    final confirmed = await BaseConfirmSheet.show(
      context: context,
      title: l10n.deleteTitle,
      text: l10n.deleteText,
      confirmText: l10n.deleteConfirm,
      isDestructive: true,
    );
    if (confirmed) await cubit.delete();
  }
}

class const _EditActions() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipDetail;
    final cubit = context.read<SlipDetailCubit>();
    final isLoading = context.select((SlipDetailCubit cubit) => cubit.state.saveAction.isLoading);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseButton(text: l10n.editSave, isLoading: isLoading, onPressed: cubit.saveEdit),
        const SizedBox(height: AppSpace.s10),
        BaseButton(text: l10n.editCancel, variant: .secondary, onPressed: cubit.cancelEditing),
      ],
    );
  }
}
