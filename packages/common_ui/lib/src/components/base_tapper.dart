import 'package:flutter/material.dart' show InkWell, Material;
import 'package:flutter/widgets.dart';

class const BaseTapper({
  required final Widget child,
  final GestureTapCallback? onTap,
  final BorderRadiusGeometry? borderRadius,
  final Color? backgroundColor,
  final Color? rippleColor,
  final ShapeBorder? shape,
  super.key,
}) extends StatelessWidget {
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
