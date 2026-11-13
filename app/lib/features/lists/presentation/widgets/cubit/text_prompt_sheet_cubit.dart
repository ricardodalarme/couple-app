import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

part 'text_prompt_sheet_state.dart';

/// Draft state of the one-field prompt sheet; the sheet confirms with [submit].
class TextPromptSheetCubit() extends Cubit<TextPromptSheetState> {
  this : super(const TextPromptSheetState());

  void start({required String initialText, required int maxLength}) =>
      emit(TextPromptSheetState(text: FormInput(initialText), maxLength: maxLength));

  void onTextChanged(String text) => emit(state.copyWith(text: FormInput(text)));

  /// Validates the text and returns it trimmed, or null when it is invalid.
  String? submit() {
    final validatedText = state.text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(state.maxLength)]),
    );

    emit(state.copyWith(text: validatedText));

    if (!validatedText.isValid) return null;

    return validatedText.value.trim();
  }
}
