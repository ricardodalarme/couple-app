import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

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
  late String _text = widget.item.text;

  bool get _canSave {
    final trimmed = _text.trim();

    return trimmed.isNotEmpty && trimmed.length <= learnedItemMaxLength;
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
          text: _text,
          hint: l10n.editHint,
          maxLength: learnedItemMaxLength,
          onChanged: (text) => setState(() => _text = text),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: l10n.save, isEnabled: _canSave, onPressed: _canSave ? _save : null),
      ],
    );
  }

  void _save() {
    widget.onSave(_text.trim());
    Navigator.of(context).maybePop();
  }
}
