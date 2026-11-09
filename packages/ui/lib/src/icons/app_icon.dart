import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

export 'app_icons.dart';

/// An icon tinted by the theme. Decorative unless [semanticLabel] is supplied.
class const AppIcon({
  required final IconData icon,
  final double size = AppIconSize.md,
  final Color? color,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Icon(icon, size: size, color: color ?? colors.iconDefault, semanticLabel: semanticLabel);
  }
}
