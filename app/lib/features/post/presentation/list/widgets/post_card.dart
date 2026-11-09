import 'package:flutter_bloc_starter/features/post/data/models/post.dart';
import 'package:ui/ui.dart';

class const PostCard({required final Post post, super.key}) extends StatelessWidget {
  static const _profilePictureSize = 38.0;
  static const _bodyMaxLines = 7;

  @override
  Widget build(BuildContext context) {
    return BaseSurfaceCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseAvatar(imageUrl: post.authorImageUrl, size: _profilePictureSize),
          const SizedBox(width: AppSpace.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title, style: context.text.titleSm),
                const SizedBox(height: AppSpace.s4),
                Text(
                  post.body,
                  style: context.text.body,
                  maxLines: _bodyMaxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
