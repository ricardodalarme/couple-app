import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/repair/data/data_sources/repair_data_source.dart';
import 'package:flutter_bloc_starter/features/repair/data/repositories/repair_repository.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/quick_repair/cubit/quick_repair_cubit.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/soft_start/cubit/soft_start_cubit.dart';
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
    ..registerFactory<SoftStartCubit>(SoftStartCubit.new)
    ..registerFactory<QuickRepairCubit>(
      () => QuickRepairCubit(repairRepository: injector.get<RepairRepository>()),
    )
    ..registerFactory<TemperatureCubit>(
      () => TemperatureCubit(repairRepository: injector.get<RepairRepository>()),
    );
}
