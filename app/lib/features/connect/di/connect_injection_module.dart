import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/connect/data/data_sources/connect_data_source.dart';
import 'package:flutter_bloc_starter/features/connect/data/repositories/connect_repository.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/touch/cubit/touch_cubit.dart';
import 'package:flutter_bloc_starter/features/connect/presentation/us/cubit/us_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:network/network.dart';

class ConnectInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ConnectDataSource>(
      () => ConnectDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<ConnectRepository>(
      () => ConnectRepository(
        dataSource: injector.get<ConnectDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    )
    ..registerFactory<UsCubit>(() => UsCubit(connectRepository: injector.get<ConnectRepository>()))
    ..registerFactory<TouchCubit>(
      () => TouchCubit(connectRepository: injector.get<ConnectRepository>()),
    );
}
