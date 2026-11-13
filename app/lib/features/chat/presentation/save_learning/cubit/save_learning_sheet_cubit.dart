import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:form_inputs/form_inputs.dart';

part 'save_learning_sheet_state.dart';

/// Draft state of the save learning sheet; the sheet saves what [submit] returns.
class SaveLearningSheetCubit() extends Cubit<SaveLearningSheetState> {
  this : super(const SaveLearningSheetState());

  void start({required String initialText}) =>
      emit(SaveLearningSheetState(text: FormInput(_cut(initialText))));

  void onTargetChanged(LearnedTarget target) => emit(state.copyWith(target: target));

  void onTextChanged(String text) => emit(state.copyWith(text: FormInput(text)));

  /// Validates the text and returns the picked target with it, or null when either is missing.
  ({LearnedTarget target, String text})? submit() {
    final target = state.target;
    if (target == null) return null;

    final validatedText = state.text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(learnedItemMaxLength)]),
    );

    emit(state.copyWith(text: validatedText));

    if (!validatedText.isValid) return null;

    return (target: target, text: validatedText.value.trim());
  }

  static String _cut(String text) =>
      text.length > learnedItemMaxLength ? text.substring(0, learnedItemMaxLength) : text;
}
