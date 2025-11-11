import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(const SettingsState());

  final SettingsRepository _settingsRepository;

  void opened() {
    final Settings settings = _settingsRepository.get();
    emit(state.copyWith(settings: settings));
  }

  Future<void> onUseBiometricsChanged(bool value) async {
    final Settings newSettings = state.settings.copyWith(useBiometrics: value);

    emit(state.copyWith(settings: newSettings));
    await _settingsRepository.save(newSettings);
  }
}
