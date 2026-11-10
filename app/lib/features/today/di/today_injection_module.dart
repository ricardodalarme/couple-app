import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_local_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/repositories/today_repository.dart';
import 'package:flutter_bloc_starter/features/today/presentation/today/cubit/today_cubit.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class TodayInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<TodayDataSource>(
      () => TodayDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<TodayLocalDataSource>(
      () => TodayLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<TodayRepository>(
      () => TodayRepository(
        dataSource: injector.get<TodayDataSource>(),
        localDataSource: injector.get<TodayLocalDataSource>(),
      ),
    )
    ..registerFactory<TodayCubit>(
      () => TodayCubit(
        todayRepository: injector.get<TodayRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
        repairRepository: injector.get<RepairRepository>(),
      ),
    );
}
