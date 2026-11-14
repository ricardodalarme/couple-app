import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:uuid/uuid.dart';

part 'temperature_state.dart';

class TemperatureCubit({required final RepairRepository _repairRepository})
    extends Cubit<TemperatureState> {
  this : super(const TemperatureState());

  final Uuid _uuid = const Uuid();
  String? _sessionId;

  void onLevelChosen(Temperature level) => emit(state.copyWith(level: level));

  void onIntensityChanged(int intensity) => emit(state.copyWith(intensity: intensity));

  /// Moves on from the level step: a good level ends here, anything else asks for intensity.
  Future<void> continueFromLevel() async {
    final level = state.level;
    if (level == null || state.saveAction.isLoading) return;

    if (level == Temperature.good) {
      await _record(level, TemperatureStep.result);
      return;
    }
    emit(state.copyWith(step: TemperatureStep.intensity));
  }

  /// Stores the answer and the chosen path, then shows the result.
  Future<void> finish() async {
    final level = state.level;
    if (level == null || state.saveAction.isLoading) return;

    final path = pathFor(level: level, intensity: state.intensity);
    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _repairRepository.recordTemperature(level);
      if (path != null) {
        await _repairRepository.startSession(
          id: _sessionId ??= _uuid.v4(),
          path: path,
          intensity: state.intensity,
        );
      }
      emit(state.copyWith(step: TemperatureStep.result, saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }

  /// Goes back one step without losing the answers.
  void back() {
    if (state.step == TemperatureStep.intensity) {
      emit(state.copyWith(step: TemperatureStep.level));
    }
  }

  Future<void> _record(Temperature level, TemperatureStep next) async {
    emit(state.copyWith(saveAction: const Loading()));
    try {
      await _repairRepository.recordTemperature(level);
      emit(state.copyWith(step: next, saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(saveAction: Failure.fromObject(exception)));
      emit(state.copyWith(saveAction: const Initial()));
    }
  }
}
