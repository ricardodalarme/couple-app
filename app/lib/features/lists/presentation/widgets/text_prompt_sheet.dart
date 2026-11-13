import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:form_inputs/form_inputs.dart';

/// A sheet with one text field and its confirm action.
class const TextPromptSheet({
  required final String label,
  required final String confirmText,
  required final int maxLength,
  required final ValueChanged<String> onConfirm,
  required final Map<String, String> errors,
  final String initialText = '',
  final String? hint,
  super.key,
}) extends StatefulWidget {
  @override
  State<TextPromptSheet> createState() => _TextPromptSheetState();
}

class _TextPromptSheetState() extends State<TextPromptSheet> {
  late FormInput<String> _text = FormInput(widget.initialText);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: _text.value,
          label: widget.label,
          hint: widget.hint,
          errorText: widget.errors.selectOrNull(_text.errorName),
          onChanged: (text) => setState(() => _text = FormInput(text)),
          onSubmitted: (_) => _submit(),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: widget.confirmText, onPressed: _submit),
      ],
    );
  }

  void _submit() {
    final validatedText = _text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(widget.maxLength)]),
    );

    setState(() => _text = validatedText);
    if (!validatedText.isValid) return;

    widget.onConfirm(validatedText.value.trim());
    Navigator.of(context).maybePop();
  }
}
