import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'memories_state.dart';

class MemoriesCubit({required final MemoriesRepository _memoriesRepository})
    extends Cubit<MemoriesState> {
  this : super(const MemoriesState());

  final Uuid _uuid = const Uuid();
  String? _pendingId;

  Future<void> load() async {
    if (state.memories is! Success) emit(state.copyWith(memories: const Loading()));
    try {
      emit(state.copyWith(memories: Success(await _memoriesRepository.getMemories())));
    } catch (exception) {
      if (state.memories is Success) return;
      emit(state.copyWith(memories: Failure.fromObject(exception)));
    }
  }

  /// Switches view; opening the jar draws a slip when none is showing.
  Future<void> onViewChanged(MemoriesView view) async {
    if (view == state.view) return;
    emit(state.copyWith(view: view));
    if (view == MemoriesView.jar && state.jarAction is! Success) await drawFromJar();
  }

  void openForm() => emit(state.copyWith(isFormOpen: true));

  void onTitleChanged(String title) => emit(state.copyWith(title: FormInput(title)));

  void onBodyChanged(String body) => emit(state.copyWith(body: FormInput(body)));

  void onPlaceChanged(String place) => emit(state.copyWith(place: FormInput(place)));

  /// Saves the typed memory dated today; on failure the text stays so it can be sent again.
  Future<void> save() async {
    if (state.saveAction.isLoading || !_validate()) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _memoriesRepository.addMemory(
        id: _pendingId ??= _uuid.v4(),
        title: state.title.value,
        body: state.body.value,
        place: state.place.value,
        happenedOn: clock.now(),
      );
      _pendingId = null;
      emit(
        state.copyWith(
          title: const FormInput(''),
          body: const FormInput(''),
          place: const FormInput(''),
          isFormOpen: false,
          saveAction: const Success(null),
        ),
      );
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  /// Validates every field in one pass and reports whether the form can be saved.
  bool _validate() {
    final validatedTitle = state.title.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(memoryTitleMaxLength)]),
    );
    final validatedBody = state.body.validate(MaxLengthValidator(memoryBodyMaxLength));
    final validatedPlace = state.place.validate(MaxLengthValidator(memoryPlaceMaxLength));

    emit(state.copyWith(title: validatedTitle, body: validatedBody, place: validatedPlace));

    return validatedTitle.isValid && validatedBody.isValid && validatedPlace.isValid;
  }

  Future<void> delete(Memory memory) async {
    try {
      await _memoriesRepository.deleteMemory(memory.id);
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  /// Draws one slip from the jar; an empty jar says so instead of inventing something.
  Future<void> drawFromJar() async {
    if (state.jarAction.isLoading) return;

    emit(state.copyWith(jarAction: const Loading()));
    try {
      emit(state.copyWith(jarAction: Success(await _memoriesRepository.drawFromJar())));
    } catch (exception) {
      emit(state.copyWith(jarAction: Failure.fromObject(exception)));
    }
  }

  /// Closes the drawn slip.
  void closeJar() => emit(state.copyWith(jarAction: const Initial(), view: MemoriesView.timeline));
}
