import 'package:ui/ui.dart';

/// Step sizes of [BaseIconTile]: 32, 40 and 48 points.
enum BaseIconTileSize() {
  small,
  medium,
  large,
}

/// The two colour treatments of [BaseIconTile].
enum BaseIconTileVariant() {
  accent,
  neutral,
}

const double _smallSide = 32;
const double _mediumSide = 40;
const double _largeSide = 48;

/// A rounded square that carries a single line icon.
///
/// The accent variant reads on `accent.soft`; the neutral variant uses the
/// fixed neutral surface for markers that must not compete with the theme.
/// When [onTap] is supplied the tile owns a 44pt target around its visual.
class const BaseIconTile({
  required final IconData icon,
  final BaseIconTileVariant variant = BaseIconTileVariant.accent,
  final BaseIconTileSize size = BaseIconTileSize.medium,
  final VoidCallback? onTap,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isAccent = variant == BaseIconTileVariant.accent;

    final tile = Container(
      width: _side,
      height: _side,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isAccent ? colors.accentSoft : AppPalette.neutral100,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: AppIcon(icon: icon, color: isAccent ? colors.accentLabel : colors.iconDefault),
    );

    if (onTap != null) {
      return AppPressable(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        semanticLabel: semanticLabel,
        enforceMinTapTarget: true,
        child: tile,
      );
    }
    if (semanticLabel == null) return tile;

    return Semantics(label: semanticLabel, image: true, child: tile);
  }

  double get _side => switch (size) {
    .small => _smallSide,
    .medium => _mediumSide,
    .large => _largeSide,
  };
}
