import 'package:common_ui/src/components/base_avatar.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:flutter/widgets.dart';

/// Overlapping circular avatars with an optional "+N" overflow badge.
class const BaseAvatarStack({
  required final List<String?> photoUrls,
  final int max = 6,
  final double size = 36,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  static const double _overlapRatio = 0.28;

  @override
  Widget build(BuildContext context) {
    if (photoUrls.isEmpty || max <= 0) return const SizedBox.shrink();

    final visible = photoUrls.take(max).toList();
    final overflow = photoUrls.length - visible.length;
    final step = size * (1 - _overlapRatio);
    final slotCount = visible.length + (overflow > 0 ? 1 : 0);

    final stack = SizedBox(
      width: size + (slotCount - 1) * step,
      height: size,
      child: Stack(
        children: [
          for (var index = 0; index < visible.length; index++)
            Positioned(
              left: index * step,
              child: _RingedAvatar(photoUrl: visible[index], size: size),
            ),
          if (overflow > 0)
            Positioned(
              left: visible.length * step,
              child: _OverflowBadge(count: overflow, size: size),
            ),
        ],
      ),
    );

    final label = semanticLabel;
    if (label == null) return ExcludeSemantics(child: stack);

    return Semantics(
      label: label,
      container: true,
      child: ExcludeSemantics(child: stack),
    );
  }
}

class const _RingedAvatar({required final String? photoUrl, required final double size})
    extends StatelessWidget {
  static const double _ringWidth = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.palette.background, width: _ringWidth),
      ),
      child: BaseAvatar(photoUrl: photoUrl, size: size - _ringWidth * 2),
    );
  }
}

class const _OverflowBadge({required final int count, required final double size})
    extends StatelessWidget {
  static const double _ringWidth = 2;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.container,
        border: Border.all(color: palette.background, width: _ringWidth),
      ),
      child: Text(
        '+$count',
        style: context.typography.labelMedium.copyWith(color: palette.onContainer),
      ),
    );
  }
}
