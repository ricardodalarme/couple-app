part of 'settings_bloc.dart';

final class SettingsState with EquatableMixin {
  const SettingsState({this.settings = const Settings.empty()});

  final Settings settings;

  SettingsState copyWith({Settings? settings}) {
    return SettingsState(settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [settings];
}
