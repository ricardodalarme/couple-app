import 'package:flutter/material.dart' show IconButton;
import 'package:flutter/widgets.dart';

class BaseIconButton extends StatelessWidget {
  const BaseIconButton({
    required this.onPressed,
    required this.icon,
    this.color,
    this.tooltip,
    super.key,
  });

  final VoidCallback onPressed;
  final Color? color;
  final String? tooltip;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, color: color, tooltip: tooltip, icon: icon);
  }
}
