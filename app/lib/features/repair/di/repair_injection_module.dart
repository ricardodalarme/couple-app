import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/repair_data_source.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/temperature/cubit/temperature_cubit.dart';
import 'package:network/network.dart';

class RepairInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<RepairDataSource>(
      () => RepairDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<RepairRepository>(
      () => RepairRepository(dataSource: injector.get<RepairDataSource>()),
    )
    ..registerFactory<TemperatureCubit>(
      () => TemperatureCubit(repairRepository: injector.get<RepairRepository>()),
    );
}
