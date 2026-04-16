import 'package:flutter_bloc_starter/features/post/data/data_sources/post_data_source.dart';
import 'package:flutter_bloc_starter/features/post/data/mappers/post_response_mapper.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:logger/logger.dart';

class PostRepository {
  PostRepository({required PostDataSource postDataSource}) : _postDataSource = postDataSource;

  final Logger _logger = Logger('PostRepository');
  final PostDataSource _postDataSource;

  Future<List<Post>> getPosts({int? first, String? after}) async {
    _logger.info('Fetching posts first=$first after=$after');
    try {
      final result = await _postDataSource.getPosts(first: first, after: after);

      final posts = result.edges.map((edge) => edge.node.toModel()).toList();

      _logger.trace('Fetched ${posts.length} posts');
      return posts;
    } catch (e, stack) {
      _logger.error('Failed to fetch posts', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
