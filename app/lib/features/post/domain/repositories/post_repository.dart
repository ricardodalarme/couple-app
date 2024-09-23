import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';

abstract interface class PostRepository {
  Future<List<PostModel>> getPosts({
    int? first,
    String? after,
  });
}
