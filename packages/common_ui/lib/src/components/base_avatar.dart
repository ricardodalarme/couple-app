import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_ui/common_ui.dart';

class BaseAvatar extends StatelessWidget {
  const BaseAvatar({required this.photoUrl, required this.size, super.key});

  final String? photoUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final fallbackAvatar = Icon(Icons.person, size: size, color: context.palette.onContainer);

    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: context.palette.container),
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
            : Center(child: fallbackAvatar),
      ),
    );
  }
}
