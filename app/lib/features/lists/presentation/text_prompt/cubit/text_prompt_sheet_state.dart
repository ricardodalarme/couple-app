part of 'text_prompt_sheet_cubit.dart';

final class const TextPromptSheetState({
  final FormInput<String> text = const FormInput(''),
  final int maxLength = 0,
}) with Equatable {
  TextPromptSheetState copyWith({FormInput<String>? text, int? maxLength}) =>
      TextPromptSheetState(text: text ?? this.text, maxLength: maxLength ?? this.maxLength);

  @override
  List<Object?> get props => [text, maxLength];
}
