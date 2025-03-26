import 'package:common_ui/common_ui.dart' hide ListTile;
import 'package:flutter/material.dart' show Card, ListTile;
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';

const _profilePictureSize = 40.0;
const _bodyMaxLines = 7;

class PostCard extends StatelessWidget {
  const PostCard({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ProfilePicture(photoUrl: post.authorImageUrl, size: _profilePictureSize),
        isThreeLine: true,
        title: Text(post.title, style: context.typography.titleSmall),
        subtitle: Text(post.body, maxLines: _bodyMaxLines, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
