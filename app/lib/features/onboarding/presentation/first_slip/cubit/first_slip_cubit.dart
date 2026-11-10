import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:uuid/uuid.dart';

part 'first_slip_state.dart';

/// The step of the first-use sequence this screen completes.
const int firstSlipStep = 4;

/// Writes the very first slip before any account exists; nothing leaves the device.
class FirstSlipCubit({
  required final SlipRepository _slipRepository,
  required final SettingsRepository _settingsRepository,
}) extends Cubit<FirstSlipState> {
  this : super(const FirstSlipState());

  void onTextChanged(String text) => emit(state.copyWith(text: text));

  Future<void> save() async {
    if (!state.canSave || state.saveAction.isLoading) return;

    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _slipRepository.keepOnDevice(
        id: const Uuid().v4(),
        body: state.text.trim(),
        createdAt: DateTime.now(),
      );
      await _markStepDone();
      emit(state.copyWith(saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  Future<void> skip() => _markStepDone();

  Future<void> _markStepDone() {
    final settings = _settingsRepository.get();

    return _settingsRepository.save(
      settings.copyWith(introStep: math.max(settings.introStep, firstSlipStep)),
    );
  }
}
