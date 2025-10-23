import 'package:flutter/material.dart' show InkWell, Material;
import 'package:flutter/widgets.dart';

class BaseTapper extends StatelessWidget {
  const BaseTapper({
    required this.child,
    required this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.rippleColor,
    super.key,
  });

  final Widget child;
  final GestureTapCallback onTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? rippleColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Material(
        color: backgroundColor,
        child: InkWell(splashColor: rippleColor, onTap: onTap, child: child),
      ),
    );
  }
}
