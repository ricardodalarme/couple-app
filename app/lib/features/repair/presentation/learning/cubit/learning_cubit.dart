import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:uuid/uuid.dart';

part 'learning_state.dart';

/// The longest learning note the server accepts.
const int learningMaxLength = 1000;

class LearningCubit({required final RepairRepository _repairRepository})
    extends Cubit<LearningState> {
  this : super(const LearningState());

  final Uuid _uuid = const Uuid();
  String? _pendingId;

  Future<void> load() async {
    if (state.learnings is! Success) emit(state.copyWith(learnings: const Loading()));
    try {
      emit(state.copyWith(learnings: Success(await _repairRepository.getLearnings())));
    } catch (exception) {
      if (state.learnings is Success) return;
      emit(state.copyWith(learnings: Failure.fromObject(exception)));
    }
  }

  void onKindChosen(RepairLearningKind kind) => emit(state.copyWith(kind: kind));

  void onNoteChanged(String note) => emit(state.copyWith(note: FormInput(note)));

  /// Saves the note, private to the person, tied to [sessionId] when it came from a repair.
  Future<void> save({String? sessionId}) async {
    final kind = state.kind;
    if (state.saveAction.isLoading || !_validate() || kind == null) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _repairRepository.saveLearning(
        id: _pendingId ??= _uuid.v4(),
        kind: kind,
        note: state.note.value,
        sessionId: sessionId,
      );
      _pendingId = null;
      emit(
        state.copyWith(note: const FormInput(''), clearKind: true, saveAction: const Success(null)),
      );
      await load();
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  bool _validate() {
    final validatedNote = state.note.validate(
      CompositeValidator<String>([NonEmptyValidator(), MaxLengthValidator(learningMaxLength)]),
    );

    emit(state.copyWith(note: validatedNote));

    return validatedNote.isValid;
  }

  Future<void> delete(String id) async {
    try {
      await _repairRepository.deleteLearning(id);
      final current = state.learnings;
      if (current is Success<List<Learning>>) {
        emit(
          state.copyWith(
            learnings: Success([
              for (final item in current.value)
                if (item.id != id) item,
            ]),
          ),
        );
      }
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
