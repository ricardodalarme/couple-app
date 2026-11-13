import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/widgets/cubit/text_prompt_sheet_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';

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
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => TextPromptSheetCubit()..start(initialText: initialText, maxLength: maxLength),
    child: _TextPromptContent(
      label: label,
      confirmText: confirmText,
      errors: errors,
      hint: hint,
      onConfirm: onConfirm,
    ),
  );
}

class const _TextPromptContent({
  required final String label,
  required final String confirmText,
  required final Map<String, String> errors,
  required final ValueChanged<String> onConfirm,
  final String? hint,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = context.select((TextPromptSheetCubit cubit) => cubit.state.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          text: text.value,
          label: label,
          hint: hint,
          errorText: errors.selectOrNull(text.errorName),
          onChanged: context.read<TextPromptSheetCubit>().onTextChanged,
          onSubmitted: (_) => _submit(context),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseButton(text: confirmText, onPressed: () => _submit(context)),
      ],
    );
  }

  void _submit(BuildContext context) {
    final value = context.read<TextPromptSheetCubit>().submit();
    if (value == null) return;

    onConfirm(value);
    Navigator.of(context).maybePop();
  }
}
