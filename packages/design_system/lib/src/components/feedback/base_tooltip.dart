import 'package:design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

/// How touch reveals a [BaseTooltip] message.
enum BaseTooltipTrigger() {
  tap,
  longPress,
}

/// A short label shown when a control is hovered, tapped or long-pressed.
class const BaseTooltip({
  required final String message,
  required final Widget child,
  final BaseTooltipTrigger trigger = BaseTooltipTrigger.longPress,
  final bool preferBelow = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: switch (trigger) {
        .tap => TooltipTriggerMode.tap,
        .longPress => TooltipTriggerMode.longPress,
      },
      preferBelow: preferBelow,
      waitDuration: const Duration(milliseconds: 400),
      showDuration: const Duration(seconds: 4),
      verticalOffset: AppSpace.s8,
      constraints: const BoxConstraints(maxWidth: 240),
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.s14, vertical: AppSpace.s10),
      textStyle: context.text.caption.copyWith(color: AppPalette.white),
      decoration: BoxDecoration(
        color: AppPalette.neutral900,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: child,
    );
  }
}
