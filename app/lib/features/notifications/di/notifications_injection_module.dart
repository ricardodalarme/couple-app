import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/inbox/cubit/notifications_cubit.dart';
import 'package:network/network.dart';

class NotificationsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<NotificationsDataSource>(
      () => NotificationsDataSource(graphQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<NotificationsRepository>(
      () =>
          NotificationsRepository(notificationsDataSource: injector.get<NotificationsDataSource>()),
    )
    ..registerFactory<NotificationsCubit>(
      () => NotificationsCubit(notificationsRepository: injector.get<NotificationsRepository>()),
    )
    ..registerFactory<NotificationsBadgeCubit>(
      () =>
          NotificationsBadgeCubit(notificationsRepository: injector.get<NotificationsRepository>()),
    );
}
