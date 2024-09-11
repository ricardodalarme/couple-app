import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const SettingsState()) {
    on<SettingsOpened>(_onSettingsOpened);
    on<SettingsUseBiometricsChangedEvent>(
      _onSettingsUseBiometricsChanged,
    );
  }

  final SettingsRepository _settingsRepository;

  void _onSettingsOpened(
    SettingsOpened event,
    Emitter<SettingsState> emit,
  ) {
    final settings = _settingsRepository.get();
    emit(state.copyWith(settings: settings));
  }

  Future<void> _onSettingsUseBiometricsChanged(
    SettingsUseBiometricsChangedEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final newSettings = state.settings.copyWith(
      useBiometrics: event.value,
    );

    emit(state.copyWith(settings: newSettings));
    await _settingsRepository.save(newSettings);
  }
}
