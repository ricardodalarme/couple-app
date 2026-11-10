import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/memories/data/data_sources/memories_data_source.dart';
import 'package:flutter_bloc_starter/features/memories/data/repositories/memories_repository.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/memories/cubit/memories_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:network/network.dart';

class MemoriesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<MemoriesDataSource>(
      () => MemoriesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<MemoriesRepository>(
      () => MemoriesRepository(
        dataSource: injector.get<MemoriesDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
      ),
    )
    ..registerFactory<MemoriesCubit>(
      () => MemoriesCubit(memoriesRepository: injector.get<MemoriesRepository>()),
    );
}
