import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart' show CircleAvatar, Icons;

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({required this.photoUrl, required this.size, super.key});

  final String? photoUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final fallbackAvatar = Icon(Icons.person, size: size, color: context.palette.onContainer);

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: context.palette.container,
      child: photoUrl != null
          ? ClipOval(
              child: CachedNetworkImage(
                imageUrl: photoUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => fallbackAvatar,
              ),
            )
          : fallbackAvatar,
    );
  }
}
