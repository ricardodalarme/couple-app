part of 'settings_bloc.dart';

sealed class SettingsEvent with EquatableMixin {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class SettingsOpened extends SettingsEvent {
  const SettingsOpened();
}

final class SettingsUseBiometricsChangedEvent extends SettingsEvent {
  const SettingsUseBiometricsChangedEvent(this.value);

  final bool value;
}
