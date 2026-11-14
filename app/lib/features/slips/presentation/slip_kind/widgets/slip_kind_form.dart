import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const SlipKindForm({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kind = context.select((SlipKindCubit cubit) => cubit.state.kind);
    final l10n = context.l10n.slipKind;
    final (title, highlight, subtitle) = switch (kind) {
      'if_then' => (l10n.ifThen.title, l10n.ifThen.titleHighlight, l10n.ifThen.subtitle),
      'invisible' => (l10n.invisible.title, l10n.invisible.titleHighlight, l10n.invisible.subtitle),
      _ => (l10n.specific.title, l10n.specific.titleHighlight, l10n.specific.subtitle),
    };

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _KindChips(),
          const SizedBox(height: AppSpace.s20),
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: title,
              highlight: highlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s8),
          Text(subtitle, style: context.text.body.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: AppSpace.s20),
          switch (kind) {
            'if_then' => const _IfThenFields(),
            'invisible' => const _InvisibleFields(),
            _ => const _SpecificFields(),
          },
        ],
      ),
      footer: const _SaveButton(),
    );
  }
}

class const _KindChips() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = context.l10n.slipKind.kinds;
    final switcherL10n = context.l10n.slipKind;
    final selected = context.select((SlipKindCubit cubit) => cubit.state.kind);

    return Wrap(
      spacing: AppSpace.s8,
      runSpacing: AppSpace.s8,
      children: [
        for (final kind in slipKinds)
          BaseChoiceChip(
            label: labels.selectOrFallback(kind),
            isSelected: selected == kind,
            onTap: () => context.read<SlipKindCubit>().onKindChanged(kind),
          ),
        BaseChoiceChip(
          label: switcherL10n.quickEntry,
          onTap: () async {
            await context.read<SlipKindCubit>().keepQuickDraft();
            if (!context.mounted) return;
            await context.router.replace(const QuickSlipRoute());
          },
        ),
        BaseChoiceChip(
          label: switcherL10n.needEntry,
          onTap: () => context.router.replace(const NeedRoute()),
        ),
      ],
    );
  }
}

class const _MainText({required final String hint}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = context.select((SlipKindCubit cubit) => cubit.state.text);

    return BaseTextArea(
      text: text.value,
      hint: hint,
      maxLength: slipKindMaxLength,
      errorText: context.l10n.slipKind.textErrors.selectOrNull(text.errorName),
      onChanged: context.read<SlipKindCubit>().onTextChanged,
    );
  }
}

class const _SpecificFields() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipKind.specific;
    final feeling = context.select((SlipKindCubit cubit) => cubit.state.feeling);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MainText(hint: l10n.hint),
        const SizedBox(height: AppSpace.s16),
        BaseTextField(
          text: feeling.value,
          label: l10n.feelingLabel,
          hint: l10n.feelingHint,
          errorText: context.l10n.slipKind.feelingErrors.selectOrNull(feeling.errorName),
          onChanged: context.read<SlipKindCubit>().onFeelingChanged,
        ),
      ],
    );
  }
}

class const _IfThenFields() extends StatefulWidget {
  @override
  State<_IfThenFields> createState() => _IfThenFieldsState();
}

class _IfThenFieldsState() extends State<_IfThenFields> {
  final GlobalKey _planKey = GlobalKey();

  void _keepPlanVisible(bool hasFocus) {
    if (!hasFocus) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final planContext = _planKey.currentContext;
      if (planContext == null || !planContext.mounted) return;

      Scrollable.ensureVisible(
        planContext,
        alignment: .35,
        duration: const Duration(milliseconds: 250),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipKind.ifThen;
    final plan = context.select((SlipKindCubit cubit) => cubit.state.plan);
    final cubit = context.read<SlipKindCubit>();

    return Focus(
      onFocusChange: _keepPlanVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.ifLabel, style: context.text.label),
          const SizedBox(height: AppSpace.s8),
          _MainText(hint: l10n.ifHint),
          const SizedBox(height: AppSpace.s16),
          KeyedSubtree(
            key: _planKey,
            child: BaseTextField(
              text: plan.value,
              label: l10n.thenLabel,
              hint: l10n.thenHint,
              errorText: context.l10n.slipKind.planErrors.selectOrNull(plan.errorName),
              onChanged: cubit.onPlanChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class const _InvisibleFields() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipKind.invisible;
    final selected = context.select((SlipKindCubit cubit) => cubit.state.workArea);
    final labels = context.l10n.slipKind.workAreas;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _MainText(hint: l10n.hint),
        const SizedBox(height: AppSpace.s16),
        Text(l10n.areaLabel, style: context.text.label),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final area in SlipWorkArea.values)
              BaseChoiceChip(
                label: labels.selectOrFallback(area.name),
                isSelected: selected == area,
                onTap: () => context.read<SlipKindCubit>().onWorkAreaToggled(area),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s20),
        BaseNote(text: l10n.private),
      ],
    );
  }
}

class const _SaveButton() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((SlipKindCubit cubit) => cubit.state.saveAction.isLoading);

    return BaseButton(
      text: context.l10n.slipKind.save,
      isLoading: isLoading,
      onPressed: context.read<SlipKindCubit>().save,
    );
  }
}
