import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/lists/data/data_sources/remote/lists_data_source.dart';
import 'package:flutter_bloc_starter/features/lists/data/repositories/lists_repository.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/detail/cubit/list_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/lists/presentation/lists/cubit/lists_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:network/network.dart';

class ListsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ListsDataSource>(
      () => ListsDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<ListsRepository>(
      () => ListsRepository(
        dataSource: injector.get<ListsDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
      ),
    )
    ..registerFactory<ListsCubit>(
      () => ListsCubit(listsRepository: injector.get<ListsRepository>()),
    )
    ..registerFactory<ListDetailCubit>(
      () => ListDetailCubit(listsRepository: injector.get<ListsRepository>()),
    );
}
