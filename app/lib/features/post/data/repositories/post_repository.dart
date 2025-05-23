import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

class PostRepository {
  PostRepository({
    required PostDataSource postDataSource,
    required Mapper<QueryGetPostspostsnodesPost, Post> mapper,
  }) : _postDataSource = postDataSource,
       _mapper = mapper;

  final PostDataSource _postDataSource;
  final Mapper<QueryGetPostspostsnodesPost, Post> _mapper;

  Future<List<Post>> getPosts({int? first, String? after}) async {
    final QueryGetPostsposts result = await _postDataSource.getPosts(first: first, after: after);
    final List<Post> parsedResult = result.nodes
        .whereType<QueryGetPostspostsnodesPost>()
        .map(_mapper.map)
        .toList();

    return parsedResult;
  }
}
