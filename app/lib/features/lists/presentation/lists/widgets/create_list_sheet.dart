import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:form_inputs/form_inputs.dart';

/// The sheet that names a new list, chooses its kind and who can see it.
class const CreateListSheet({
  required final bool hasPartner,
  required final void Function(String title, String kind, bool isShared) onCreate,
  super.key,
}) extends StatefulWidget {
  @override
  State<CreateListSheet> createState() => _CreateListSheetState();
}

class _CreateListSheetState() extends State<CreateListSheet> {
  FormInput<String> _title = const FormInput('');
  String _kind = listKinds.first;
  late bool _isShared = widget.hasPartner;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: _title.value,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          errorText: l10n.titleErrors.selectOrNull(_title.errorName),
          onChanged: (title) => setState(() => _title = FormInput(title)),
          onSubmitted: (_) => _submit(),
        ),
        const SizedBox(height: AppSpace.s16),
        Text(
          l10n.kindLabel,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        Wrap(
          spacing: AppSpace.s8,
          runSpacing: AppSpace.s8,
          children: [
            for (final kind in listKinds)
              BaseChoiceChip(
                label: l10n.kinds.selectOrFallback(kind),
                isSelected: _kind == kind,
                onTap: () => setState(() => _kind = kind),
              ),
          ],
        ),
        if (widget.hasPartner) ...[
          const SizedBox(height: AppSpace.s16),
          Text(
            l10n.visibilityLabel,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
          const SizedBox(height: AppSpace.s8),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              BaseChoiceChip(
                label: l10n.shared,
                icon: AppIcons.users,
                isSelected: _isShared,
                onTap: () => setState(() => _isShared = true),
              ),
              BaseChoiceChip(
                label: l10n.private,
                icon: AppIcons.lock,
                isSelected: !_isShared,
                onTap: () => setState(() => _isShared = false),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            _isShared ? l10n.sharedHint : l10n.privateHint,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
        ] else ...[
          const SizedBox(height: AppSpace.s16),
          Text(
            l10n.privateHint,
            style: context.text.caption.copyWith(color: context.colors.textSecondary),
          ),
        ],
        const SizedBox(height: AppSpace.s20),
        BaseButton(text: l10n.create, onPressed: _submit),
      ],
    );
  }

  void _submit() {
    final validatedTitle = _title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(listTitleMaxLength)]),
    );

    setState(() => _title = validatedTitle);
    if (!validatedTitle.isValid) return;

    widget.onCreate(validatedTitle.value.trim(), _kind, _isShared);
    Navigator.of(context).maybePop();
  }
}
