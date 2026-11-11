import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
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

  void openForm() => emit(state.copyWith(isFormOpen: true));

  void onTitleChanged(String title) => emit(state.copyWith(title: title));

  void onBodyChanged(String body) => emit(state.copyWith(body: body));

  void onPlaceChanged(String place) => emit(state.copyWith(place: place));

  /// Saves the typed memory dated today; on failure the text stays so it can be sent again.
  Future<void> save() async {
    if (!state.canSave || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _memoriesRepository.addMemory(
        id: _pendingId ??= _uuid.v4(),
        title: state.title,
        body: state.body,
        place: state.place,
        happenedOn: DateTime.now(),
      );
      _pendingId = null;
      emit(
        state.copyWith(
          title: '',
          body: '',
          place: '',
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
  void closeJar() => emit(state.copyWith(jarAction: const Initial()));
}
