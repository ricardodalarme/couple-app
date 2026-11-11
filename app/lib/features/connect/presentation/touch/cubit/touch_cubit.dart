import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';

part 'touch_state.dart';

class TouchCubit({required final ConnectRepository _connectRepository}) extends Cubit<TouchState> {
  this : super(const TouchState());

  Future<void> load() async {
    emit(state.copyWith(isEnabled: const Loading()));
    try {
      final isEnabled = await _connectRepository.getTouchTopicsEnabled();
      final cards = isEnabled ? await _connectRepository.getTouchCards() : <HelpItem>[];
      emit(state.copyWith(isEnabled: Success(isEnabled), cards: cards, index: 0));
    } catch (exception) {
      emit(state.copyWith(isEnabled: Failure.fromObject(exception)));
    }
  }

  /// Turns touch topics on or off for both people.
  Future<void> setEnabled({required bool enabled}) async {
    if (state.toggleAction.isLoading) return;

    emit(state.copyWith(toggleAction: const Loading()));
    try {
      await _connectRepository.setTouchTopicsEnabled(enabled: enabled);
      emit(state.copyWith(toggleAction: const Success(null)));
      await load();
    } catch (exception) {
      emit(state.copyWith(toggleAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(toggleAction: const Initial()));
  }

  /// Moves to the next card, wrapping around; nothing is recorded about done or skipped.
  void next() {
    if (state.cards.isEmpty) return;
    emit(state.copyWith(index: (state.index + 1) % state.cards.length));
  }
}
