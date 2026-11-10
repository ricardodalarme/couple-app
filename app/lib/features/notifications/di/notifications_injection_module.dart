import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/off_banner/cubit/notifications_off_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/permission/cubit/notification_permission_cubit.dart';
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
      ),
    )
    ..registerFactory<NotificationPermissionCubit>(
      () => NotificationPermissionCubit(repository: injector.get<NotificationsRepository>()),
    )
    ..registerFactory<NotificationsOffCubit>(
      () => NotificationsOffCubit(repository: injector.get<NotificationsRepository>()),
    );
}
