part of 'settings_bloc.dart';

final class SettingsState with EquatableMixin {
  const SettingsState({this.settings = const SettingsModel.empty()});

  final SettingsModel settings;

  SettingsState copyWith({SettingsModel? settings}) {
    return SettingsState(settings: settings ?? this.settings);
  }

  @override
  List<Object> get props => [settings];
}
