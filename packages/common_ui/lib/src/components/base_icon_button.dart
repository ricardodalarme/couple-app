import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show IconButton;

class const BaseIconButton({
  required final VoidCallback onPressed,
  required final Widget icon,
  final Color? color,
  final String? tooltip,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, color: color, tooltip: tooltip, icon: icon);
  }
}
