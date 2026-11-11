import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

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
  late String _text = _cut(widget.initialText);
  LearnedTarget? _target;

  bool get _canSave {
    final trimmed = _text.trim();

    return _target != null && trimmed.isNotEmpty && trimmed.length <= learnedItemMaxLength;
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
          text: _text,
          hint: l10n.learningSheetHint,
          maxLength: learnedItemMaxLength,
          onChanged: (text) => setState(() => _text = text),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(
          text: l10n.learningSave,
          isEnabled: _canSave,
          onPressed: _canSave ? _save : null,
        ),
      ],
    );
  }

  void _save() {
    final target = _target;
    if (target == null || !_canSave) return;
    widget.onSave(target, _text.trim());
    Navigator.of(context).maybePop();
  }

  static String _cut(String text) =>
      text.length > learnedItemMaxLength ? text.substring(0, learnedItemMaxLength) : text;
}
