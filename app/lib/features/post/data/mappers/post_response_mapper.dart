import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/domain/models/post_model.dart';

final class PostResponseMapper implements Mapper<QueryGetPostspostsnodesPost, PostModel> {
  @override
  PostModel map(QueryGetPostspostsnodesPost input) {
    return PostModel(
      id: input.id,
      title: input.title,
      body: input.body,
      authorImageUrl: input.createdBy.profilePicture?.url,
    );
  }
}
