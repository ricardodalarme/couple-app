import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/features/chat/presentation/learned_item_edit/cubit/learned_item_edit_sheet_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Edits a learning's text; its target stays fixed.
class const LearnedItemEditSheet({
  required final LearnedItem item,
  required final ValueChanged<String> onSave,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => LearnedItemEditSheetCubit()..start(item: item),
    child: _LearnedItemEditContent(onSave: onSave),
  );
}

class const _LearnedItemEditContent({required final ValueChanged<String> onSave})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.learned;
    final text = context.select((LearnedItemEditSheetCubit cubit) => cubit.state.text);
    final target = context.select((LearnedItemEditSheetCubit cubit) => cubit.state.target);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.targets.selectOrFallback(target?.name),
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextArea(
          text: text.value,
          hint: l10n.editHint,
          maxLength: learnedItemMaxLength,
          errorText: l10n.textErrors.selectOrNull(text.errorName),
          onChanged: context.read<LearnedItemEditSheetCubit>().onTextChanged,
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: l10n.save, onPressed: () => _save(context)),
      ],
    );
  }

  void _save(BuildContext context) {
    final value = context.read<LearnedItemEditSheetCubit>().submit();
    if (value == null) return;

    onSave(value);
    Navigator.of(context).maybePop();
  }
}
