part of 'learned_item_edit_sheet_cubit.dart';

final class const LearnedItemEditSheetState({
  final FormInput<String> text = const FormInput(''),
  final LearnedTarget? target,
}) with Equatable {
  LearnedItemEditSheetState copyWith({
    FormInput<String>? text,
    LearnedTarget? target,
    bool clearTarget = false,
  }) => LearnedItemEditSheetState(
    text: text ?? this.text,
    target: clearTarget ? null : target ?? this.target,
  );

  @override
  List<Object?> get props => [text, target];
}
