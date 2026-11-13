import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:form_inputs/form_inputs.dart';

/// What the gift sheet hands back to the page.
final class const GiftDraft({
  final String title = '',
  final String? note,
  final String? budget,
  final bool isShared = false,
  final bool isDelete = false,
});

/// The sheet that adds or edits one wish.
class const GiftSheet({required final bool hasPartner, final GiftIdea? gift, super.key})
    extends StatefulWidget {
  @override
  State<GiftSheet> createState() => _GiftSheetState();
}

class _GiftSheetState() extends State<GiftSheet> {
  late FormInput<String> _title = FormInput(widget.gift?.title ?? '');
  late FormInput<String> _note = FormInput(widget.gift?.note ?? '');
  late String? _budget = widget.gift?.budget;
  late bool _isShared = widget.gift?.isShared ?? false;

  bool get _isEditing => widget.gift != null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.gifts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: _title.value,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          errorText: l10n.titleErrors.selectOrNull(_title.errorName),
          onChanged: (title) => setState(() => _title = FormInput(title)),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseTextArea(
          text: _note.value,
          hint: l10n.noteHint,
          maxLength: giftNoteMaxLength,
          maxLines: 4,
          hasError: !_note.isValid,
          errorText: l10n.noteErrors.selectOrNull(_note.errorName),
          onChanged: (note) => setState(() => _note = FormInput(note)),
        ),
        const SizedBox(height: AppSpace.s16),
        Text(
          l10n.budgetLabel,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            BaseChoiceChip(
              label: l10n.noBudget,
              isSelected: _budget == null,
              onTap: () => setState(() => _budget = null),
            ),
            for (final budget in giftBudgets)
              BaseChoiceChip(
                label: l10n.budgets.selectOrFallback(budget),
                isSelected: _budget == budget,
                onTap: () => setState(() => _budget = budget),
              ),
          ],
        ),
        if (!_isEditing) ...[
          const SizedBox(height: AppSpace.s16),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.hasPartner
                      ? (_isShared ? l10n.sharedHint : l10n.privateHint)
                      : l10n.sharedNeedsPartner,
                  style: context.text.caption.copyWith(color: context.colors.textSecondary),
                ),
              ),
              if (widget.hasPartner) ...[
                const SizedBox(width: AppSpace.s12),
                BaseSwitch(
                  value: _isShared,
                  semanticLabel: _isShared ? l10n.shared : l10n.private,
                  onChanged: (shared) => setState(() => _isShared = shared),
                ),
              ],
            ],
          ),
        ],
        const SizedBox(height: AppSpace.s24),
        BaseButton(text: _isEditing ? l10n.save : l10n.add, onPressed: _save),
        if (_isEditing) ...[
          const SizedBox(height: AppSpace.s10),
          BaseButton(text: l10n.delete, variant: .secondary, onPressed: _delete),
        ],
      ],
    );
  }

  void _save() {
    final validatedTitle = _title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(giftTitleMaxLength)]),
    );
    final validatedNote = _note.validate(MaxLengthValidator(giftNoteMaxLength));

    setState(() {
      _title = validatedTitle;
      _note = validatedNote;
    });
    if (!validatedTitle.isValid || !validatedNote.isValid) return;

    Navigator.of(context).pop(
      GiftDraft(
        title: validatedTitle.value.trim(),
        note: _clean(validatedNote.value),
        budget: _budget,
        isShared: _isShared,
      ),
    );
  }

  void _delete() => Navigator.of(context).pop(const GiftDraft(isDelete: true));

  String? _clean(String value) {
    final trimmed = value.trim();

    return trimmed.isEmpty ? null : trimmed;
  }
}
