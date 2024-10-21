import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/mappers/post_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';

class PostInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<PostDataSource>(
      () => PostDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    )
    ..registerFactory<Mapper<QueryGetPostspostsnodesPost, PostModel>>(
      PostResponseMapper.new,
    )
    ..registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        postDataSource: injector.get<PostDataSource>(),
        mapper: injector.get<Mapper<QueryGetPostspostsnodesPost, PostModel>>(),
      ),
    )
    ..registerFactory<PostBloc>(
      () => PostBloc(
        postRepository: injector.get<PostRepository>(),
      ),
    );
}
