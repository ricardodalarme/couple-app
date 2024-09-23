import 'dart:async';

import 'package:common/common.dart';
import 'package:common_data/common_data.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/mappers/post_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/post/data/repositories/post_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:schemas/queries/generated/GetPosts.graphql.dart';

class PostInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerSingleton<PostDataSource>(
      PostDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    );

    injector.registerSingleton<Mapper<QueryGetPostspostsnodesPost, PostModel>>(
      PostResponseMapper(),
    );

    injector.registerSingleton<PostRepository>(
      PostRepositoryImpl(
        postDataSource: injector.get<PostDataSource>(),
        mapper: injector.get<Mapper<QueryGetPostspostsnodesPost, PostModel>>(),
      ),
    );

    injector.registerFactory<PostBloc>(
      () => PostBloc(
        postRepository: injector.get<PostRepository>(),
      ),
    );
  }
}
