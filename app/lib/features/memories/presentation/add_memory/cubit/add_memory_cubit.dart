import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:form_inputs/form_inputs.dart';

part 'add_memory_state.dart';

/// Draft state of the add-memory sheet; the sheet pops with the result of [submit].
class AddMemoryCubit() extends Cubit<AddMemoryState> {
  this : super(const AddMemoryState());

  void onTitleChanged(String title) => emit(state.copyWith(title: FormInput(title)));

  void onBodyChanged(String body) => emit(state.copyWith(body: FormInput(body)));

  void onPlaceChanged(String place) => emit(state.copyWith(place: FormInput(place)));

  /// Validates the fields and returns the draft, or null when a field is invalid.
  ({String title, String body, String place})? submit() {
    final validatedTitle = state.title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(memoryTitleMaxLength)]),
    );
    final validatedBody = state.body.validate(MaxLengthValidator(memoryBodyMaxLength));
    final validatedPlace = state.place.validate(MaxLengthValidator(memoryPlaceMaxLength));

    emit(state.copyWith(title: validatedTitle, body: validatedBody, place: validatedPlace));

    if (!validatedTitle.isValid || !validatedBody.isValid || !validatedPlace.isValid) return null;

    return (title: validatedTitle.value, body: validatedBody.value, place: validatedPlace.value);
  }
}
