import 'package:clock/clock.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/data/repositories/programs_repository.dart';
import 'package:form_inputs/form_inputs.dart';

part 'diary_state.dart';

class DiaryCubit({required final ProgramsRepository _programsRepository})
    extends Cubit<DiaryState> {
  this : super(const DiaryState());

  /// Reads the entries and starts the form on today's entry when there is one.
  ///
  /// Text the person typed while the read was in flight is never replaced.
  Future<void> load() async {
    if (state.entries is! Success) emit(state.copyWith(entries: const Loading()));
    try {
      final entries = await _programsRepository.getDiaryEntries();
      if (isClosed) return;
      if (state.isDirty) {
        emit(state.copyWith(entries: Success(entries)));

        return;
      }
      final today = entries.where((entry) => entry.isOn(clock.now())).firstOrNull;
      emit(
        state.copyWith(
          entries: Success(entries),
          body: FormInput(today?.body ?? ''),
          mood: today?.mood,
          editingId: today?.id,
          clearMood: today == null,
          clearEditing: today == null,
        ),
      );
    } catch (exception) {
      if (isClosed || state.entries is Success) return;
      emit(state.copyWith(entries: Failure.fromObject(exception)));
    }
  }

  void onBodyChanged(String body) => emit(state.copyWith(body: FormInput(body), isDirty: true));

  void onMoodChanged(String mood) => emit(
    state.copyWith(
      mood: state.mood == mood ? null : mood,
      clearMood: state.mood == mood,
      isDirty: true,
    ),
  );

  void edit(DiaryEntry entry) => emit(
    state.copyWith(
      body: FormInput(entry.body),
      mood: entry.mood,
      editingId: entry.id,
      clearMood: entry.mood == null,
      isDirty: true,
    ),
  );

  /// Opens today's entry when one exists, so a day never gets a second entry.
  void newEntry() {
    final today = switch (state.entries) {
      Success(:final value) => value.where((entry) => entry.isOn(clock.now())).firstOrNull,
      _ => null,
    };
    if (today != null) {
      edit(today);

      return;
    }
    emit(
      state.copyWith(body: const FormInput(''), clearMood: true, clearEditing: true, isDirty: true),
    );
  }

  /// Saves the text; a failed save leaves the text and the selected mood in place.
  Future<void> save() async {
    if (state.saveAction.isLoading || !_validate()) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      final id = await _programsRepository.saveDiaryEntry(
        entryDate: clock.now(),
        body: state.body.value.trim(),
        mood: state.mood,
        id: state.editingId,
      );
      if (isClosed) return;
      emit(state.copyWith(editingId: id, saveAction: const Success(null)));
      await _reloadEntries();
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  bool _validate() {
    final validatedBody = state.body.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(journalBodyMaxLength)]),
    );

    emit(state.copyWith(body: validatedBody));

    return validatedBody.isValid;
  }

  Future<void> delete(DiaryEntry entry) async {
    if (state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _programsRepository.deleteDiaryEntry(entry.id);
      if (isClosed) return;
      if (state.editingId == entry.id) {
        emit(state.copyWith(body: const FormInput(''), clearMood: true, clearEditing: true));
      }
      emit(state.copyWith(saveAction: const Success(null)));
      await _reloadEntries();
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> _reloadEntries() async {
    try {
      final entries = await _programsRepository.getDiaryEntries();
      if (isClosed) return;
      emit(state.copyWith(entries: Success(entries)));
    } catch (exception) {
      if (isClosed) return;
      emit(state.copyWith(entries: Failure.fromObject(exception)));
    }
  }
}
