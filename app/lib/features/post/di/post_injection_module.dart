import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/mappers/post_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/bloc/posts_list_bloc.dart';

class PostInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PostDataSource>(
      () => PostDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerFactory<Mapper<QueryGetPostspostsnodesPost, Post>>(PostResponseMapper.new)
    ..registerLazySingleton<PostRepository>(
      () => PostRepository(
        postDataSource: injector.get<PostDataSource>(),
        mapper: injector.get<Mapper<QueryGetPostspostsnodesPost, Post>>(),
      ),
    )
    ..registerFactory<PostsListBloc>(
      () => PostsListBloc(postRepository: injector.get<PostRepository>()),
    );
}
