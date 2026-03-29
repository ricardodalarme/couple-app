import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/post/data/data_sources/post_data_source.dart';
import 'package:flutter_bloc_starter/features/post/data/repositories/post_repository.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:network/network.dart';

class PostInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PostDataSource>(
      () => PostDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<PostRepository>(
      () => PostRepository(postDataSource: injector.get<PostDataSource>()),
    )
    ..registerFactory<PostsListCubit>(
      () => PostsListCubit(postRepository: injector.get<PostRepository>()),
    );
}
