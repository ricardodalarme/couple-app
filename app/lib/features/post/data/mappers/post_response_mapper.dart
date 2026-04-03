import 'package:flutter_bloc_starter/features/post/data/data_sources/fragments/generated/PostFragment.graphql.dart';
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';

extension PostResponseMapper on FragmentPostFragment {
  Post toModel() {
    return Post(id: id, title: title, body: content, authorImageUrl: author_image_url);
  }
}
