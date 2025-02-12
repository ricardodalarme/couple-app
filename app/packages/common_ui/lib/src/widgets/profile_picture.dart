import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_ui/src/theme/theme_extensions.dart';
import 'package:flutter/material.dart' show CircleAvatar, Icons;
import 'package:flutter/widgets.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({required this.photoUrl, required this.size, super.key});

  final String? photoUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final fallbackAvatar = Icon(Icons.person, size: size, color: context.colors.onSurface);

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: context.colors.secondary,
      child:
          photoUrl != null
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
