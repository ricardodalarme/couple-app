import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit({required final SettingsRepository _settingsRepository})
    extends Cubit<SettingsState> {
  this : super(const SettingsState());

  void opened() {
    final settings = _settingsRepository.get();
    emit(state.copyWith(settings: settings));
  }

  Future<void> onUseBiometricsChanged(bool value) async {
    final newSettings = state.settings.copyWith(useBiometrics: value);

    emit(state.copyWith(settings: newSettings));
    await _settingsRepository.save(newSettings);
  }
}
