import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/games/data/data_sources/remote/games_data_source.dart';
import 'package:flutter_bloc_starter/features/games/data/repositories/games_repository.dart';
import 'package:flutter_bloc_starter/features/games/presentation/game/cubit/game_cubit.dart';
import 'package:flutter_bloc_starter/features/games/presentation/hub/cubit/games_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:network/network.dart';

class GamesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<GamesDataSource>(
      () => GamesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<GamesRepository>(
      () => GamesRepository(dataSource: injector.get<GamesDataSource>()),
    )
    ..registerFactory<GamesCubit>(() => GamesCubit(repository: injector.get<GamesRepository>()))
    ..registerFactory<GameCubit>(
      () => GameCubit(
        repository: injector.get<GamesRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
      ),
    );
}
