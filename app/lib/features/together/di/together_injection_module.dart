import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/checkin/data/repositories/checkin_repository.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/together_data_source.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/services/ritual_reminder_service.dart';
import 'package:flutter_bloc_starter/features/together/presentation/date_night/cubit/date_night_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/day/cubit/day_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/help/cubit/help_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/logistics/cubit/logistics_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/ritual_edit/cubit/ritual_edit_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/rituals/cubit/rituals_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:network/network.dart';

class TogetherInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<TogetherDataSource>(
      () => TogetherDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<TogetherRepository>(
      () => TogetherRepository(dataSource: injector.get<TogetherDataSource>()),
    )
    ..registerFactory<TogetherCubit>(
      () => TogetherCubit(
        pairingRepository: injector.get<PairingRepository>(),
        checkinRepository: injector.get<CheckinRepository>(),
        listsRepository: injector.get<ListsRepository>(),
      ),
    )
    ..registerLazySingleton<RitualReminderService>(
      () => RitualReminderService(
        remindersRepository: injector.get<RemindersRepository>(),
        syncService: injector.get<ReminderSyncService>(),
      ),
    )
    ..registerFactory<RitualsCubit>(
      () => RitualsCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        reminderService: injector.get<RitualReminderService>(),
      ),
    )
    ..registerFactory<RitualEditCubit>(
      () => RitualEditCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        reminderService: injector.get<RitualReminderService>(),
      ),
    )
    ..registerFactory<HelpCubit>(
      () => HelpCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    )
    ..registerFactory<DayCubit>(
      () => DayCubit(
        datesRepository: injector.get<DatesRepository>(),
        togetherRepository: injector.get<TogetherRepository>(),
      ),
    )
    ..registerFactory<DateNightCubit>(
      () => DateNightCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    )
    ..registerFactory<LogisticsCubit>(
      () => LogisticsCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
      ),
    );
}
