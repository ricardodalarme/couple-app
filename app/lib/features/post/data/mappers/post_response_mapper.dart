import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

final class PostResponseMapper implements Mapper<QueryGetPostspostsnodesPost, Post> {
  @override
  Post map(QueryGetPostspostsnodesPost input) {
    return Post(
      id: input.id,
      title: input.title,
      body: input.body,
      authorImageUrl: input.createdBy.profilePicture?.url,
    );
  }
}
