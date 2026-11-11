import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';

part 'spice_state.dart';

class SpiceCubit({required final SpiceRepository _spiceRepository}) extends Cubit<SpiceState> {
  this : super(const SpiceState());

  Future<void> load() async {
    if (_spiceRepository.isHidden) {
      emit(state.copyWith(isHidden: true));
      return;
    }
    emit(state.copyWith(view: const Loading()));
    try {
      emit(state.copyWith(view: Success(await _spiceRepository.getView()), index: 0));
    } catch (exception) {
      emit(state.copyWith(view: Failure.fromObject(exception)));
    }
  }

  /// Turns the mode on or off for this person only and reads the state again.
  Future<void> setEnabled({required bool enabled}) async {
    if (state.toggleAction.isLoading) return;

    emit(state.copyWith(toggleAction: const Loading()));
    try {
      await _spiceRepository.setEnabled(enabled: enabled);
      emit(state.copyWith(toggleAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(toggleAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(toggleAction: const Initial()));
  }

  /// Moves to the next card, wrapping around.
  void next() {
    final view = state.view;
    if (view is! Success<SpiceView> || view.value.cards.isEmpty) return;
    emit(state.copyWith(index: (state.index + 1) % view.value.cards.length));
  }
}
