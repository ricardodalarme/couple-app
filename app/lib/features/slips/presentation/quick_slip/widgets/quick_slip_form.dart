import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const QuickSlipForm({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.quickSlip;

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _DateLine(),
          const SizedBox(height: AppSpace.s8),
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
          const _TextField(),
          const SizedBox(height: AppSpace.s16),
          const _CategoryChips(),
          const SizedBox(height: AppSpace.s20),
          BaseNote(text: l10n.privacyNote),
        ],
      ),
      footer: const _SaveButton(),
    );
  }
}

class const _DateLine() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.quickSlip;
    final now = DateTime.now();
    final text = l10n.dateLine(
      weekday: l10n.weekdays[now.weekday - 1],
      day: now.day,
      month: l10n.monthsShort[now.month - 1],
    );

    return Text(text, style: context.text.label.copyWith(color: context.colors.textSecondary));
  }
}

class const _TextField() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.quickSlip;
    final text = context.select((QuickSlipCubit cubit) => cubit.state.text);

    return BaseTextArea(
      text: text,
      hint: l10n.hint,
      onChanged: context.read<QuickSlipCubit>().onTextChanged,
    );
  }
}

class const _CategoryChips() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = context.l10n.quickSlip.categories;
    final selected = context.select((QuickSlipCubit cubit) => cubit.state.category);

    return Wrap(
      spacing: AppSpace.s8,
      runSpacing: AppSpace.s8,
      children: [
        for (final category in quickSlipCategories)
          BaseChoiceChip(
            label: labels.selectOrFallback(category),
            isSelected: selected == category,
            onTap: () => context.read<QuickSlipCubit>().onCategoryToggled(category),
          ),
      ],
    );
  }
}

class const _SaveButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final canSave = context.select((QuickSlipCubit cubit) => cubit.state.canSave);
    final isLoading = context.select((QuickSlipCubit cubit) => cubit.state.saveAction.isLoading);

    return BaseButton(
      text: context.l10n.quickSlip.save,
      isEnabled: canSave,
      isLoading: isLoading,
      onPressed: context.read<QuickSlipCubit>().save,
    );
  }
}
