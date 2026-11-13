import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/chat/data/models/learned_item.dart';
import 'package:form_inputs/form_inputs.dart';

part 'learned_item_edit_sheet_state.dart';

/// Draft state of the learned item edit sheet; the sheet saves what [submit] returns.
class LearnedItemEditSheetCubit() extends Cubit<LearnedItemEditSheetState> {
  this : super(const LearnedItemEditSheetState());

  void start({required LearnedItem item}) =>
      emit(LearnedItemEditSheetState(text: FormInput(item.text), target: item.target));

  void onTextChanged(String text) => emit(state.copyWith(text: FormInput(text)));

  /// Validates the text and returns it trimmed, or null when it is invalid.
  String? submit() {
    final validatedText = state.text.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(learnedItemMaxLength)]),
    );

    emit(state.copyWith(text: validatedText));

    if (!validatedText.isValid) return null;

    return validatedText.value.trim();
  }
}
