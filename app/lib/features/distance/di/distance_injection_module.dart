import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/distance/data/data_sources/remote/distance_data_source.dart';
import 'package:flutter_bloc_starter/features/distance/data/repositories/distance_repository.dart';
import 'package:flutter_bloc_starter/features/distance/presentation/distance/cubit/distance_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:network/network.dart';

class DistanceInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<DistanceDataSource>(
      () => DistanceDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<DistanceRepository>(
      () => DistanceRepository(
        dataSource: injector.get<DistanceDataSource>(),
        profileRepository: injector.get<ProfileRepository>(),
        datesRepository: injector.get<DatesRepository>(),
      ),
    )
    ..registerFactory<DistanceCubit>(
      () => DistanceCubit(distanceRepository: injector.get<DistanceRepository>()),
    );
}
