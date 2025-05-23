import 'package:core/core.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/repositories/settings_repository.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/bloc/settings_bloc.dart';

class SettingsInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(storage: injector.get<PersistentStorageService>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(localDataSource: injector.get<SettingsLocalDataSource>()),
    )
    ..registerFactory<SettingsBloc>(
      () => SettingsBloc(settingsRepository: injector.get<SettingsRepository>()),
    );
}
