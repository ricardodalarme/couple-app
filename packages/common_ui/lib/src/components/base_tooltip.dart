import 'package:flutter/material.dart' show Tooltip, TooltipTriggerMode;
import 'package:flutter/widgets.dart';

class BaseTooltip extends StatelessWidget {
  const BaseTooltip({required this.text, required this.child, super.key});

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: text, triggerMode: TooltipTriggerMode.tap, child: child);
  }
}
