import 'dart:async';

import 'package:core/core.dart';
import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/models/settings_local.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/mappers/settings_local_to_model_mapper.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/mappers/settings_model_to_local_mapper.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';
import 'package:quickstart_flutter_bloc/features/settings/presentation/bloc/settings_bloc.dart';

class SettingsInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(
        storage: injector.get<PersistentStorageService>(),
      ),
    )
    ..registerFactory<Mapper<SettingsLocal, SettingsModel>>(
      SettingsLocalToModelMapper.new,
    )
    ..registerFactory<Mapper<SettingsModel, SettingsLocal>>(
      SettingsModelToLocalMapper.new,
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localDataSource: injector.get<SettingsLocalDataSource>(),
        settingsLocalToModelMapper:
            injector.get<Mapper<SettingsLocal, SettingsModel>>(),
        settingsModelToLocalMapper:
            injector.get<Mapper<SettingsModel, SettingsLocal>>(),
      ),
    )
    ..registerFactory<SettingsBloc>(
      () => SettingsBloc(
        settingsRepository: injector.get<SettingsRepository>(),
      ),
    );
}
