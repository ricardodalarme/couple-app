import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_kind.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/create_list/cubit/create_list_sheet_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The sheet that names a new list, chooses its kind and who can see it.
class const CreateListSheet({
  required final bool hasPartner,
  required final void Function(String title, ListKind kind, bool isShared) onCreate,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CreateListSheetCubit()..start(hasPartner: hasPartner),
    child: _CreateListContent(onCreate: onCreate),
  );
}

class const _CreateListContent({
  required final void Function(String title, ListKind kind, bool isShared) onCreate,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.lists;
    final title = context.select((CreateListSheetCubit cubit) => cubit.state.title);
    final kind = context.select((CreateListSheetCubit cubit) => cubit.state.kind);
    final isShared = context.select((CreateListSheetCubit cubit) => cubit.state.isShared);
    final hasPartner = context.select((CreateListSheetCubit cubit) => cubit.state.hasPartner);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: title.value,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          errorText: l10n.titleErrors.selectOrNull(title.errorName),
          onChanged: context.read<CreateListSheetCubit>().onTitleChanged,
          onSubmitted: (_) => _submit(context),
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
            for (final kindOption in ListKind.values)
              BaseChoiceChip(
                label: l10n.kinds.selectOrFallback(kindOption.name),
                isSelected: kind == kindOption,
                onTap: () => context.read<CreateListSheetCubit>().onKindChanged(kindOption),
              ),
          ],
        ),
        if (hasPartner) ...[
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
                isSelected: isShared,
                onTap: () => context.read<CreateListSheetCubit>().onSharedChanged(true),
              ),
              BaseChoiceChip(
                label: l10n.private,
                icon: AppIcons.lock,
                isSelected: !isShared,
                onTap: () => context.read<CreateListSheetCubit>().onSharedChanged(false),
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s8),
          Text(
            isShared ? l10n.sharedHint : l10n.privateHint,
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
        BaseButton(text: l10n.create, onPressed: () => _submit(context)),
      ],
    );
  }

  void _submit(BuildContext context) {
    final draft = context.read<CreateListSheetCubit>().submit();
    if (draft == null) return;

    onCreate(draft.title, draft.kind, draft.isShared);
    Navigator.of(context).maybePop();
  }
}
