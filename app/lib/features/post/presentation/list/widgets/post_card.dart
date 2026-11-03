import 'package:common_ui/common_ui.dart' hide BaseListTile;
import 'package:flutter_bloc_starter/features/post/data/models/post.dart';

class const PostCard({required final Post post, super.key}) extends StatelessWidget {
  static const _profilePictureSize = 38.0;
  static const _bodyMaxLines = 7;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      leading: BaseAvatar(photoUrl: post.authorImageUrl, size: _profilePictureSize),
      title: post.title,
      child: Text(post.body, maxLines: _bodyMaxLines, overflow: TextOverflow.ellipsis),
    );
  }
}
