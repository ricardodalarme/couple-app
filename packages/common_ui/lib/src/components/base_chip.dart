import 'package:common_ui/src/components/base_tapper.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/borders.dart';
import 'package:common_ui/src/tokens/durations.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

/// A pill-shaped, toggleable filter chip with an optional leading icon.
class const BaseChip({
  required final String label,
  required final bool selected,
  required final VoidCallback onTap,
  final Widget? icon,
  super.key,
}) extends StatelessWidget {
  static const double _height = 40;
  static const double _tapTarget = 48;
  static const double _iconSize = 16;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final foreground = selected ? palette.onPrimary : palette.onBackground;
    final radius = BorderRadius.circular(Borders.xlarge);
    final hideAnimation = MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    return BaseTapper(
      onTap: onTap,
      borderRadius: radius,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: _tapTarget),
        child: Center(
          widthFactor: 1,
          child: AnimatedContainer(
            duration: hideAnimation ? Duration.zero : Durations.fast,
            curve: Curves.easeOut,
            constraints: const BoxConstraints(minHeight: _height),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacings.medium,
              vertical: Spacings.small,
            ),
            decoration: BoxDecoration(
              color: selected ? palette.primary : palette.background,
              borderRadius: radius,
              border: Border.all(
                color: selected ? palette.primary : palette.onBackground.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  IconTheme(
                    data: IconThemeData(color: foreground, size: _iconSize),
                    child: icon!,
                  ),
                  const Gap(Spacings.xsmall),
                ],
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.labelLarge.copyWith(color: foreground),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
