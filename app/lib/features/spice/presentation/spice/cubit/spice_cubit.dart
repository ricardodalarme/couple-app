import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';

part 'spice_state.dart';

class SpiceCubit({required final SpiceRepository _spiceRepository}) extends Cubit<SpiceState> {
  this : super(const SpiceState());

  bool _hadCards = false;

  Future<void> load() async {
    if (_spiceRepository.isHidden) {
      emit(state.copyWith(isHidden: true));
      return;
    }
    emit(state.copyWith(view: const Loading()));
    await _read();
  }

  /// Reads the mode again without showing the skeleton.
  ///
  /// A partner change is observed here on resume or pull-to-refresh, not in realtime.
  Future<void> refresh() async {
    if (_spiceRepository.isHidden) {
      emit(state.copyWith(isHidden: true));
      return;
    }
    await _read();
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

  Future<void> _read() async {
    try {
      final view = await _spiceRepository.getView();
      final shouldExit = _hadCards && view.stage != SpiceStage.ready;
      _hadCards = view.stage == SpiceStage.ready;
      emit(state.copyWith(view: Success(view), index: 0, shouldExit: shouldExit));
    } catch (exception) {
      emit(state.copyWith(view: Failure.fromObject(exception)));
    }
  }
}
