import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:form_inputs/form_inputs.dart';

/// Picks what a reply becomes before it is saved as a pending learning.
class const SaveLearningSheet({
  required final String initialText,
  required final void Function(LearnedTarget target, String text) onSave,
  super.key,
}) extends StatefulWidget {
  @override
  State<SaveLearningSheet> createState() => _SaveLearningSheetState();
}

class _SaveLearningSheetState() extends State<SaveLearningSheet> {
  late FormInput<String> _text = FormInput(_cut(widget.initialText));
  LearnedTarget? _target;

  bool _validate() {
    final validatedText = _text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(learnedItemMaxLength)]),
    );

    setState(() => _text = validatedText);

    return validatedText.isValid;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.chat;
    final targets = context.l10n.learned.targets;

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
            for (final target in LearnedTarget.values)
              BaseChoiceChip(
                label: targets.selectOrFallback(target.name),
                isSelected: _target == target,
                onTap: () => setState(() => _target = target),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s16),
        BaseTextArea(
          text: _text.value,
          hint: l10n.learningSheetHint,
          maxLength: learnedItemMaxLength,
          errorText: l10n.learningTextErrors.selectOrNull(_text.errorName),
          hasError: _text.errorName != null,
          onChanged: (text) => setState(() => _text = FormInput(text)),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: l10n.learningSave, onPressed: _save),
      ],
    );
  }

  void _save() {
    final target = _target;
    if (target == null || !_validate()) return;
    widget.onSave(target, _text.value.trim());
    Navigator.of(context).maybePop();
  }

  static String _cut(String text) =>
      text.length > learnedItemMaxLength ? text.substring(0, learnedItemMaxLength) : text;
}
