import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/cubit/notifications_off_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/permission/cubit/notification_permission_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/preferences/cubit/notification_preferences_cubit.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:network/network.dart';
import 'package:notification_service/notification_service.dart';
import 'package:permission_service/permission_service.dart';

class NotificationsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<NotificationsDataSource>(
      () => NotificationsDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<NotificationsRepository>(
      () => NotificationsRepository(
        dataSource: injector.get<NotificationsDataSource>(),
        notificationService: injector.get<NotificationService>(),
        permissionService: injector.get<PermissionService>(),
        deviceInfoService: injector.get<DeviceInfoService>(),
        markerStore: injector.get<DeviceMarkerStore>(),
      ),
    )
    ..registerFactory<NotificationPermissionCubit>(
      () => NotificationPermissionCubit(repository: injector.get<NotificationsRepository>()),
    )
    ..registerFactory<NotificationPreferencesCubit>(
      () => NotificationPreferencesCubit(
        notificationsRepository: injector.get<NotificationsRepository>(),
        remindersRepository: injector.get<RemindersRepository>(),
        syncService: injector.get<ReminderSyncService>(),
      ),
    )
    ..registerFactory<NotificationsOffCubit>(
      () => NotificationsOffCubit(repository: injector.get<NotificationsRepository>()),
    );
}
