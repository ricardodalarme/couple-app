import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required PostDataSource postDataSource,
    required Mapper<QueryGetPostspostsnodesPost, PostModel> mapper,
  })  : _postDataSource = postDataSource,
        _mapper = mapper;

  final PostDataSource _postDataSource;
  final Mapper<QueryGetPostspostsnodesPost, PostModel> _mapper;

  @override
  Future<List<PostModel>> getPosts({
    int? first,
    String? after,
  }) async {
    final result = await _postDataSource.getPosts(
      first: first,
      after: after,
    );
    final parsedResult = result.nodes
        .whereType<QueryGetPostspostsnodesPost>()
        .map(_mapper.map)
        .toList();

    return parsedResult;
  }
}
