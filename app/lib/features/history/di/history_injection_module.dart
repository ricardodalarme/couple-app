import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/remote/history_data_source.dart';
import 'package:flutter_bloc_starter/features/history/data/repositories/history_repository.dart';
import 'package:flutter_bloc_starter/features/history/presentation/avatar/cubit/history_avatar_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/different_dates/cubit/different_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/milestone/cubit/milestone_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/numbers/cubit/history_numbers_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/variations/cubit/counter_variations_cubit.dart';
import 'package:network/network.dart';

class HistoryInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<HistoryDataSource>(
      () => HistoryDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<HistoryRepository>(
      () => HistoryRepository(dataSource: injector.get<HistoryDataSource>()),
    )
    ..registerFactory<HistoryCubit>(
      () => HistoryCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<MilestoneCubit>(
      () => MilestoneCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<StoryDatesCubit>(
      () => StoryDatesCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<CounterVariationsCubit>(
      () => CounterVariationsCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<HistoryAvatarCubit>(
      () => HistoryAvatarCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<HistoryNumbersCubit>(
      () => HistoryNumbersCubit(historyRepository: injector.get<HistoryRepository>()),
    )
    ..registerFactory<DifferentDatesCubit>(
      () => DifferentDatesCubit(historyRepository: injector.get<HistoryRepository>()),
    );
}
