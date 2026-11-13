part of 'save_learning_sheet_cubit.dart';

final class const SaveLearningSheetState({
  final FormInput<String> text = const FormInput(''),
  final LearnedTarget? target,
}) with Equatable {
  SaveLearningSheetState copyWith({
    FormInput<String>? text,
    LearnedTarget? target,
    bool clearTarget = false,
  }) => SaveLearningSheetState(
    text: text ?? this.text,
    target: clearTarget ? null : target ?? this.target,
  );

  @override
  List<Object?> get props => [text, target];
}
