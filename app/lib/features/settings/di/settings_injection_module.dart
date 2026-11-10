import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:preferences_service/preferences_service.dart';

class SettingsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(localDataSource: injector.get<SettingsLocalDataSource>()),
    );
}
