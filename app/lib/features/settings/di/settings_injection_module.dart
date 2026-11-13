import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/account/data/repositories/account_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/local/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/local/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/discreet_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/discreet/cubit/discreet_mode_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/home/cubit/settings_home_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/language/cubit/language_cubit.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:preferences_service/preferences_service.dart';

class SettingsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<DiscreetLocalDataSource>(
      () => DiscreetLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<DiscreetRepository>(
      () => DiscreetRepository(
        notificationsRepository: injector.get<NotificationsRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        localDataSource: injector.get<DiscreetLocalDataSource>(),
      ),
    )
    ..registerLazySingleton<DiscreetModeCubit>(
      () => DiscreetModeCubit(
        repository: injector.get<DiscreetRepository>(),
        widgetsRepository: injector.get<WidgetsRepository>(),
      ),
    )
    ..registerFactory<LanguageCubit>(
      () => LanguageCubit(repository: injector.get<SettingsRepository>()),
    )
    ..registerFactory<SettingsHomeCubit>(
      () => SettingsHomeCubit(
        pairingRepository: injector.get<PairingRepository>(),
        plusRepository: injector.get<PlusRepository>(),
        notificationsRepository: injector.get<NotificationsRepository>(),
        discreetRepository: injector.get<DiscreetRepository>(),
        accountRepository: injector.get<AccountRepository>(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepository(localDataSource: injector.get<SettingsLocalDataSource>()),
    );
}
