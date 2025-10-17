import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/bloc/posts_list_bloc.dart';

class PostInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PostDataSource>(
      () => PostDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<PostRepository>(
      () => PostRepository(postDataSource: injector.get<PostDataSource>()),
    )
    ..registerFactory<PostsListBloc>(
      () => PostsListBloc(postRepository: injector.get<PostRepository>()),
    );
}
