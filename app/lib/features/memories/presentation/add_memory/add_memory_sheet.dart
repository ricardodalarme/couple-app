import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/add_memory/cubit/add_memory_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// What the memory sheet hands back to the page.
final class const AddMemoryDraft({
  final String title = '',
  final String body = '',
  final String place = '',
});

/// The sheet that writes one memory.
class const AddMemorySheet({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AddMemoryCubit(), child: const _AddMemorySheetContent());
  }
}

class const _AddMemorySheetContent() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.memories;
    final title = context.select((AddMemoryCubit cubit) => cubit.state.title);
    final body = context.select((AddMemoryCubit cubit) => cubit.state.body);
    final place = context.select((AddMemoryCubit cubit) => cubit.state.place);
    final looksLikeAddress = context.select(
      (AddMemoryCubit cubit) => cubit.state.placeLooksLikeAddress,
    );
    final cubit = context.read<AddMemoryCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: title.value,
          label: l10n.titleLabel,
          hint: l10n.titleHint,
          errorText: l10n.titleErrors.selectOrNull(title.errorName),
          onChanged: cubit.onTitleChanged,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextField(
          text: place.value,
          label: l10n.placeLabel,
          hint: l10n.placeHint,
          helpText: looksLikeAddress ? l10n.placeAddressNote : null,
          errorText: l10n.placeErrors.selectOrNull(place.errorName),
          onChanged: cubit.onPlaceChanged,
        ),
        const SizedBox(height: AppSpace.s12),
        BaseTextArea(
          text: body.value,
          hint: l10n.bodyHint,
          maxLength: memoryBodyMaxLength,
          maxLines: 3,
          errorText: l10n.bodyErrors.selectOrNull(body.errorName),
          onChanged: cubit.onBodyChanged,
        ),
        const SizedBox(height: AppSpace.s24),
        BaseButton(text: l10n.save, onPressed: () => _save(context)),
      ],
    );
  }

  void _save(BuildContext context) {
    final draft = context.read<AddMemoryCubit>().submit();
    if (draft == null) return;

    Navigator.of(context)
        .pop(AddMemoryDraft(title: draft.title, body: draft.body, place: draft.place));
  }
}
