import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/home/cubit/settings_home_cubit.dart';
import 'package:preferences_service/preferences_service.dart';

class SettingsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerFactory<SettingsHomeCubit>(
      () => SettingsHomeCubit(
        pairingRepository: injector.get<PairingRepository>(),
        plusRepository: injector.get<PlusRepository>(),
        notificationsRepository: injector.get<NotificationsRepository>(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(localDataSource: injector.get<SettingsLocalDataSource>()),
    );
}
