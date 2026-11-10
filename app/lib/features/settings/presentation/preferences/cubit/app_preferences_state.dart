part of 'app_preferences_cubit.dart';

final class const AppPreferencesState({
  final Settings settings = const Settings.empty(),
  final Resource<void> saveAction = const Initial(),
}) with Equatable {
  AppPreferencesState copyWith({Settings? settings, Resource<void>? saveAction}) =>
      AppPreferencesState(
        settings: settings ?? this.settings,
        saveAction: saveAction ?? this.saveAction,
      );

  @override
  List<Object?> get props => [settings, saveAction];
}
