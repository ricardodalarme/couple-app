import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/remote/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/repositories/mood_repository.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:network/network.dart';

class MoodInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<MoodDataSource>(() => MoodDataSource(client: injector.get<GQLClient>()))
    ..registerLazySingleton<MoodRepository>(
      () => MoodRepository(dataSource: injector.get<MoodDataSource>()),
    )
    ..registerFactory<MoodCubit>(() => MoodCubit(moodRepository: injector.get<MoodRepository>()));
}
