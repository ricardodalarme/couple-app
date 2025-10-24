import 'package:common_ui/common_ui.dart' hide BaseListTile;
import 'package:quickstart_flutter_bloc/features/_shared/presentation/widgets/profile_picture.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({required this.post, super.key});

  final Post post;

  static const _profilePictureSize = 38.0;
  static const _bodyMaxLines = 7;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      leading: ProfilePicture(photoUrl: post.authorImageUrl, size: _profilePictureSize),
      title: post.title,
      child: Text(post.body, maxLines: _bodyMaxLines, overflow: TextOverflow.ellipsis),
    );
  }
}
