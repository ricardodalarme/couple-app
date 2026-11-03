import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart' show Tooltip, TooltipTriggerMode;

class const BaseTooltip({required final String text, required final Widget child, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(message: text, triggerMode: TooltipTriggerMode.tap, child: child);
  }
}
