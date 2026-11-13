import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/save_learning/cubit/save_learning_sheet_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Picks what a reply becomes before it is saved as a pending learning.
class const SaveLearningSheet({
  required final String initialText,
  required final void Function(LearnedTarget target, String text) onSave,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => SaveLearningSheetCubit()..start(initialText: initialText),
    child: _SaveLearningContent(onSave: onSave),
  );
}

class const _SaveLearningContent({
  required final void Function(LearnedTarget target, String text) onSave,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final targets = context.l10n.learned.targets;
    final text = context.select((SaveLearningSheetCubit cubit) => cubit.state.text);
    final target = context.select((SaveLearningSheetCubit cubit) => cubit.state.target);
    final showsTargetError = context.select(
      (SaveLearningSheetCubit cubit) => cubit.state.showsTargetError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.learningSheetTarget,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final option in LearnedTarget.values)
              BaseChoiceChip(
                label: targets.selectOrFallback(option.name),
                isSelected: target == option,
                onTap: () => context.read<SaveLearningSheetCubit>().onTargetChanged(option),
              ),
          ],
        ),
        if (showsTargetError) ...[
          const SizedBox(height: AppSpace.s6),
          Text(
            l10n.learningTargetError,
            style: context.text.caption.copyWith(color: AppPalette.errorInk),
          ),
        ],
        const SizedBox(height: AppSpace.s16),
        BaseTextArea(
          text: text.value,
          hint: l10n.learningSheetHint,
          maxLength: learnedItemMaxLength,
          errorText: l10n.learningTextErrors.selectOrNull(text.errorName),
          onChanged: context.read<SaveLearningSheetCubit>().onTextChanged,
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: l10n.learningSave, onPressed: () => _save(context)),
      ],
    );
  }

  void _save(BuildContext context) {
    final saved = context.read<SaveLearningSheetCubit>().submit();
    if (saved == null) return;

    onSave(saved.target, saved.text);
    Navigator.of(context).maybePop();
  }
}
