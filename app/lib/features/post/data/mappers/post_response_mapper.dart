import 'package:quickstart_flutter_bloc/features/post/data/data_sources/queries/generated/GetPosts.graphql.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

extension PostResponseMapper on QueryGetPostspostsnodesPost {
  Post toModel() {
    return Post(id: id, title: title, body: body, authorImageUrl: createdBy.profilePicture?.url);
  }
}
