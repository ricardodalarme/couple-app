import 'package:ui/ui.dart';

const double _smallSize = 24;
const double _largeSize = 64;
const double _smallInitialSize = 11;
const double _mediumInitialSize = 15;
const double _largeInitialSize = 22;
const double _ringWidth = 2;
const double _largeRingWidth = 3;
const double _maxInitialScale = 1.2;

/// A round face for a person in the app: photo, initial, or an empty slot.
///
/// Without a photo, the account holder sits on `accent.soft` and the partner
/// on the fixed warm grey; [isEmpty] swaps both for a dashed outline with a
/// plus. When [onTap] is supplied the avatar owns a 44pt target.
class const BaseAvatar({
  final String? initials,
  final String? imageUrl,
  final double size = 40,
  final bool isPartner = false,
  final bool isEmpty = false,
  final bool hasRing = true,
  final VoidCallback? onTap,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final circle = isEmpty ? _empty(context) : _filled(context);

    if (onTap != null) {
      return AppPressable(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        semanticLabel: semanticLabel,
        enforceMinTapTarget: true,
        child: circle,
      );
    }
    if (semanticLabel == null) return circle;

    return Semantics(label: semanticLabel, image: true, child: circle);
  }

  Widget _empty(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: DashedRoundedPainter(color: AppPalette.neutral300, radius: size / 2),
          ),
          Center(
            child: AppIcon(icon: AppIcons.plus, size: AppIconSize.sm, color: colors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _filled(BuildContext context) {
    final colors = context.colors;
    final isLarge = size >= _largeSize;
    final style = context.text.titleXs.copyWith(
      fontSize: _initialSize,
      fontWeight: FontWeight.w600,
      height: 1,
      color: isPartner ? AppPalette.partnerAvatarInk : colors.accentLabel,
    );

    Widget initial = Text(
      initials ?? '',
      maxLines: 1,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
      style: style,
    );
    if (MediaQuery.maybeOf(context) != null) {
      initial = MediaQuery.withClampedTextScaling(maxScaleFactor: _maxInitialScale, child: initial);
    }

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isPartner ? AppPalette.partnerAvatarSurface : colors.accentSoft,
        shape: BoxShape.circle,
        boxShadow: hasRing
            ? [
                BoxShadow(
                  color: colors.bgScreen,
                  spreadRadius: isLarge ? _largeRingWidth : _ringWidth,
                ),
              ]
            : null,
      ),
      child: ClipOval(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(child: initial),
            if (imageUrl != null)
              CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
          ],
        ),
      ),
    );
  }

  double get _initialSize => switch (size) {
    >= _largeSize => _largeInitialSize,
    <= _smallSize => _smallInitialSize,
    _ => _mediumInitialSize,
  };
}
