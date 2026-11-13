import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/lists/data/models/list_models.dart';
import 'package:form_inputs/form_inputs.dart';

part 'create_list_sheet_state.dart';

/// Draft state of the create list sheet; the sheet creates the list from [submit].
class CreateListSheetCubit() extends Cubit<CreateListSheetState> {
  this : super(const CreateListSheetState());

  void start({required bool hasPartner}) => emit(
    CreateListSheetState(kind: listKinds.first, isShared: hasPartner, hasPartner: hasPartner),
  );

  void onTitleChanged(String title) => emit(state.copyWith(title: FormInput(title)));

  void onKindChanged(String kind) => emit(state.copyWith(kind: kind));

  void onSharedChanged(bool isShared) => emit(state.copyWith(isShared: isShared));

  /// Validates the name and returns the list fields, or null when the name is invalid.
  ({String title, String kind, bool isShared})? submit() {
    final validatedTitle = state.title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(listTitleMaxLength)]),
    );

    emit(state.copyWith(title: validatedTitle));

    if (!validatedTitle.isValid) return null;

    return (title: validatedTitle.value.trim(), kind: state.kind, isShared: state.isShared);
  }
}
