import 'package:flutter/material.dart' show InkWell, Material;
import 'package:flutter/widgets.dart';

class BaseTapper extends StatelessWidget {
  const BaseTapper({
    required this.child,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.rippleColor,
    this.shape,
    super.key,
  });

  final Widget child;
  final GestureTapCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? rippleColor;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Material(
        color: backgroundColor,
        shape: shape,
        child: InkWell(splashColor: rippleColor, customBorder: shape, onTap: onTap, child: child),
      ),
    );
  }
}
