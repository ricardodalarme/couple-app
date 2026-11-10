import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/discreet_mode_values.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';

part 'discreet_mode_state.dart';

/// One source of truth for discreet mode; widgets and the shield read this cubit.
class DiscreetModeCubit({required final DiscreetRepository _repository})
    extends Cubit<DiscreetModeState> {
  this : super(DiscreetModeState(values: _repository.local));

  bool _hasLoaded = false;

  /// Reads the server values once; the local mirror shows immediately.
  Future<void> load() async {
    if (_hasLoaded) return;
    _hasLoaded = true;
    try {
      emit(state.copyWith(values: await _repository.load()));
    } on Object {
      _hasLoaded = false;
    }
  }

  Future<void> setNeutralNotifications({required bool value}) async {
    final previous = state.values;
    emit(
      state.copyWith(
        values: previous.copyWith(neutralNotifications: value),
        saveAction: const Loading(),
      ),
    );
    try {
      await _repository.setNeutralNotifications(value: value);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(values: previous, saveAction: Failure.fromObject(exception)));
    }
  }

  Future<void> setHideWidgetText({required bool value}) async {
    final previous = state.values;
    emit(
      state.copyWith(
        values: previous.copyWith(hideWidgetText: value),
        saveAction: const Loading(),
      ),
    );
    try {
      await _repository.setHideWidgetText(value: value);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(values: previous, saveAction: Failure.fromObject(exception)));
    }
  }

  Future<void> setNeutralIcon({required bool value}) async {
    final previous = state.values;
    emit(
      state.copyWith(
        values: previous.copyWith(neutralIcon: value),
        saveAction: const Loading(),
      ),
    );
    try {
      await _repository.setNeutralIcon(value: value);
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(values: previous, saveAction: Failure.fromObject(exception)));
    }
  }
}
