import 'package:flutter/material.dart' show Tooltip, TooltipTriggerMode;
import 'package:flutter/widgets.dart';

class const BaseTooltip({required final String text, required final Widget child, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(message: text, triggerMode: TooltipTriggerMode.tap, child: child);
  }
}
