import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/ideas/data/data_sources/local/ideas_local_data_source.dart';
import 'package:flutter_bloc_starter/features/ideas/data/data_sources/remote/ideas_data_source.dart';
import 'package:flutter_bloc_starter/features/ideas/data/repositories/ideas_repository.dart';
import 'package:flutter_bloc_starter/features/ideas/presentation/detail/cubit/idea_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class IdeasInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<IdeasDataSource>(
      () => IdeasDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<IdeasLocalDataSource>(
      () => IdeasLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<IdeasRepository>(
      () => IdeasRepository(
        dataSource: injector.get<IdeasDataSource>(),
        localDataSource: injector.get<IdeasLocalDataSource>(),
      ),
    )
    ..registerFactory<IdeaDetailCubit>(
      () => IdeaDetailCubit(
        ideasRepository: injector.get<IdeasRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        remindersRepository: injector.get<RemindersRepository>(),
        reminderSyncService: injector.get<ReminderSyncService>(),
        notificationsRepository: injector.get<NotificationsRepository>(),
      ),
    );
}
