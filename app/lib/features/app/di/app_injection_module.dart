import 'package:connectivity_service/connectivity_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/data/data_sources/remote/app_config_data_source.dart';
import 'package:flutter_bloc_starter/features/app/data/repositories/app_config_repository.dart';
import 'package:flutter_bloc_starter/features/app/presentation/connectivity/cubit/connectivity_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/time_in_app/cubit/time_in_app_cubit.dart';
import 'package:flutter_bloc_starter/features/app/presentation/version/cubit/version_gate_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class AppInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AppConfigDataSource>(
      () => AppConfigDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<AppConfigRepository>(
      () => AppConfigRepository(dataSource: injector.get<AppConfigDataSource>()),
    )
    ..registerLazySingleton<ConnectivityCubit>(
      () => ConnectivityCubit(connectivityService: injector.get<ConnectivityService>()),
    )
    ..registerLazySingleton<VersionGateCubit>(
      () => VersionGateCubit(repository: injector.get<AppConfigRepository>()),
    )
    ..registerLazySingleton<TimeInAppCubit>(
      () => TimeInAppCubit(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<AppCubit>(
      () => AppCubit(
        authenticationRepository: injector.get<AuthenticationRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        settingsRepository: injector.get<SettingsRepository>(),
        slipRepository: injector.get<SlipRepository>(),
        supportRepository: injector.get<SupportRepository>(),
        reminderSyncService: injector.get<ReminderSyncService>(),
        connectivityService: injector.get<ConnectivityService>(),
        notificationsRepository: injector.get<NotificationsRepository>(),
        devicesRepository: injector.get<DevicesRepository>(),
        widgetsRepository: injector.get<WidgetsRepository>(),
      ),
    );
}
