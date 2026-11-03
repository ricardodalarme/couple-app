part of 'settings_cubit.dart';

final class const SettingsState({final Settings settings = const Settings.empty()}) with Equatable {
  SettingsState copyWith({Settings? settings}) {
    return SettingsState(settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [settings];
}
