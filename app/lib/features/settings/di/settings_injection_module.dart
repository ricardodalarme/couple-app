import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';

class SettingsInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(storage: injector.get<PersistentStorageService>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(localDataSource: injector.get<SettingsLocalDataSource>()),
    )
    ..registerFactory<SettingsCubit>(
      () => SettingsCubit(settingsRepository: injector.get<SettingsRepository>()),
    );
}
