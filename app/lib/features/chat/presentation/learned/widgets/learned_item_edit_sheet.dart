import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:form_inputs/form_inputs.dart';

/// Edits a learning's text; its target stays fixed.
class const LearnedItemEditSheet({
  required final LearnedItem item,
  required final ValueChanged<String> onSave,
  super.key,
}) extends StatefulWidget {
  @override
  State<LearnedItemEditSheet> createState() => _LearnedItemEditSheetState();
}

class _LearnedItemEditSheetState() extends State<LearnedItemEditSheet> {
  late FormInput<String> _text = FormInput(widget.item.text);

  bool _validate() {
    final validatedText = _text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(learnedItemMaxLength)]),
    );

    setState(() => _text = validatedText);

    return validatedText.isValid;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.learned;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.targets.selectOrFallback(widget.item.target.name),
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextArea(
          text: _text.value,
          hint: l10n.editHint,
          maxLength: learnedItemMaxLength,
          errorText: l10n.textErrors.selectOrNull(_text.errorName),
          hasError: _text.errorName != null,
          onChanged: (text) => setState(() => _text = FormInput(text)),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: l10n.save, onPressed: _save),
      ],
    );
  }

  void _save() {
    if (!_validate()) return;
    widget.onSave(_text.value.trim());
    Navigator.of(context).maybePop();
  }
}
