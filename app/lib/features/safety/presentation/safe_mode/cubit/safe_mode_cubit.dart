import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';

part 'safe_mode_state.dart';

/// Whether safe mode is on; it hides the app in the app switcher and stays on after a restart.
class SafeModeCubit({required final SafeModeRepository _repository}) extends Cubit<SafeModeState> {
  this : super(SafeModeState(isOn: _repository.isOn));

  Future<void> set({required bool value}) async {
    await _repository.setOn(value: value);
    emit(SafeModeState(isOn: value));
  }
}
