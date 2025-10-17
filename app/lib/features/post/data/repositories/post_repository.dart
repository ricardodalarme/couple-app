import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/mappers/post_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

class PostRepository {
  PostRepository({required PostDataSource postDataSource}) : _postDataSource = postDataSource;

  final PostDataSource _postDataSource;

  Future<List<Post>> getPosts({int? first, String? after}) async {
    final QueryGetPostsposts result = await _postDataSource.getPosts(first: first, after: after);
    final List<Post> parsedResult = result.nodes
        .whereType<QueryGetPostspostsnodesPost>()
        .map((postResponse) => postResponse.toModel())
        .toList();

    return parsedResult;
  }
}
