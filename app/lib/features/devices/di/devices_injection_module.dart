import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/local/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/devices/data/data_sources/remote/devices_data_source.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/devices/presentation/devices/cubit/devices_cubit.dart';
import 'package:network/network.dart';

class DevicesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<DevicesDataSource>(
      () => DevicesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<DevicesRepository>(
      () => DevicesRepository(
        dataSource: injector.get<DevicesDataSource>(),
        markerStore: injector.get<DeviceMarkerStore>(),
      ),
    )
    ..registerFactory<DevicesCubit>(
      () => DevicesCubit(repository: injector.get<DevicesRepository>()),
    );
}
