import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:form_inputs/form_inputs.dart';

part 'gift_sheet_state.dart';

/// Draft state of the add/edit gift sheet; the sheet pops with the result of [submit].
class GiftSheetCubit() extends Cubit<GiftSheetState> {
  this : super(const GiftSheetState());

  void start({required bool hasPartner, GiftIdea? gift}) => emit(
    GiftSheetState(
      title: FormInput(gift?.title ?? ''),
      note: FormInput(gift?.note ?? ''),
      budget: gift?.budget,
      isShared: gift?.isShared ?? false,
      isEditing: gift != null,
      hasPartner: hasPartner,
    ),
  );

  void onTitleChanged(String title) => emit(state.copyWith(title: FormInput(title)));

  void onNoteChanged(String note) => emit(state.copyWith(note: FormInput(note)));

  void onBudgetChanged(String? budget) =>
      emit(state.copyWith(budget: budget, clearBudget: budget == null));

  void onSharedChanged(bool isShared) => emit(state.copyWith(isShared: isShared));

  /// Validates the fields and returns the draft, or null when a field is invalid.
  ({String title, String? note, String? budget, bool isShared})? submit() {
    final validatedTitle = state.title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(giftTitleMaxLength)]),
    );
    final validatedNote = state.note.validate(MaxLengthValidator(giftNoteMaxLength));

    emit(state.copyWith(title: validatedTitle, note: validatedNote));

    if (!validatedTitle.isValid || !validatedNote.isValid) return null;

    final note = validatedNote.value.trim();

    return (
      title: validatedTitle.value.trim(),
      note: note.isEmpty ? null : note,
      budget: state.budget,
      isShared: state.isShared,
    );
  }
}
