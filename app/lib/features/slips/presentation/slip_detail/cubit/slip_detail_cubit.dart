import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';

part 'slip_detail_state.dart';

class SlipDetailCubit({required final SlipRepository _slipRepository})
    extends Cubit<SlipDetailState> {
  this : super(const SlipDetailState());

  /// Loads the slip; a missing or deleted one ends as a success with no slip.
  Future<void> load(String id) async {
    emit(state.copyWith(slip: const Loading()));
    try {
      emit(state.copyWith(slip: Success(await _slipRepository.getSlip(id))));
    } catch (exception) {
      emit(state.copyWith(slip: Failure.fromObject(exception)));
    }
  }

  void startEditing() {
    final slip = state.current;
    if (slip == null) return;

    emit(state.copyWith(isEditing: true, draftBody: slip.body));
  }

  void cancelEditing() => emit(state.copyWith(isEditing: false));

  void onBodyChanged(String body) => emit(state.copyWith(draftBody: body));

  Future<void> saveEdit() async {
    final slip = state.current;
    if (slip == null || !state.canSaveEdit) return;

    await _update(slip.copyWith(body: state.draftBody.trim()), editing: false);
  }

  Future<void> setForCard({required bool value}) async {
    final slip = state.current;
    if (slip == null || !slip.canGoInCard || slip.forCard == value) return;

    await _update(slip.copyWith(forCard: value));
  }

  /// Puts the slip in the jar of good moments, or takes it out.
  Future<void> setInJar({required bool value}) async {
    final slip = state.current;
    if (slip == null || slip.isInJar == value || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _slipRepository.setInJar(id: slip.id, inJar: value);
      emit(
        state.copyWith(
          slip: Success(slip.copyWith(isInJar: value)),
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      _fail(exception);
    }
  }

  Future<void> toggleArchive() async {
    final slip = state.current;
    if (slip == null || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _slipRepository.setArchived(id: slip.id, archived: !slip.isArchived);
      emit(
        state.copyWith(
          slip: Success(slip.copyWith(isArchived: !slip.isArchived)),
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      _fail(exception);
    }
  }

  Future<void> delete() async {
    final slip = state.current;
    if (slip == null || state.deleteAction.isLoading) return;

    emit(state.copyWith(deleteAction: const Loading()));
    try {
      await _slipRepository.deleteSlip(slip.id);
      emit(state.copyWith(deleteAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(deleteAction: Failure.fromObject(exception)));
      emit(state.copyWith(deleteAction: const Initial()));
    }
  }

  Future<void> _update(SlipDetail updated, {bool? editing}) async {
    if (state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _slipRepository.updateSlip(updated);
      emit(
        state.copyWith(
          slip: Success(updated),
          isEditing: editing ?? state.isEditing,
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      _fail(exception);
    }
  }

  void _fail(Object exception) {
    emit(state.copyWith(saveAction: Failure.fromObject(exception)));
    emit(state.copyWith(saveAction: const Initial()));
  }
}
