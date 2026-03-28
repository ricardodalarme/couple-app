import 'package:logger/logger.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/post_data_source.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/mappers/post_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

class PostRepository {
  PostRepository({required PostDataSource postDataSource}) : _postDataSource = postDataSource;

  final Logger _logger = Logger('PostRepository');
  final PostDataSource _postDataSource;

  Future<List<Post>> getPosts({int? first, String? after}) async {
    _logger.info('Fetching posts first=$first after=$after');
    try {
      final QueryGetPostsposts result = await _postDataSource.getPosts(first: first, after: after);
      final List<Post> parsedResult = result.nodes
          .whereType<QueryGetPostspostsnodesPost>()
          .map((postResponse) => postResponse.toModel())
          .toList();

      _logger.trace('Fetched ${parsedResult.length} posts');
      return parsedResult;
    } catch (e, stack) {
      _logger.error('Failed to fetch posts', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
