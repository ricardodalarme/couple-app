import 'package:design_system/design_system.dart';

/// A sheet with one text field and its confirm action.
class const TextPromptSheet({
  required final String label,
  required final String confirmText,
  required final int maxLength,
  required final ValueChanged<String> onConfirm,
  final String initialText = '',
  final String? hint,
  super.key,
}) extends StatefulWidget {
  @override
  State<TextPromptSheet> createState() => _TextPromptSheetState();
}

class _TextPromptSheetState() extends State<TextPromptSheet> {
  late String _text = widget.initialText;

  bool get _canConfirm {
    final trimmed = _text.trim();

    return trimmed.isNotEmpty && trimmed.length <= widget.maxLength;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: _text,
          label: widget.label,
          hint: widget.hint,
          onChanged: (text) => setState(() => _text = text),
          onSubmitted: (_) => _submit(),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: widget.confirmText, onPressed: _canConfirm ? _submit : null),
      ],
    );
  }

  void _submit() {
    if (!_canConfirm) return;
    widget.onConfirm(_text.trim());
    Navigator.of(context).maybePop();
  }
}
