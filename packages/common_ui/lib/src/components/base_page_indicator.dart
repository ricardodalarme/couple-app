import 'package:common_ui/src/components/base_tapper.dart';
import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/durations.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

/// A row of dots marking the current page of a pager.
class const BasePageIndicator({
  required final int count,
  required final int current,
  final String? label,
  final String Function(int index)? dotLabelBuilder,
  final ValueChanged<int>? onSelected,
  final double dotSize = 6,
  final double activeDotWidth = 18,
  final Color? activeColor,
  final Color? inactiveColor,
  final Duration duration = Durations.fast,
  super.key,
}) extends StatelessWidget {
  /// Edge length of the tap target of a selectable dot.
  static const double selectionTargetSize = 48;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      container: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var index = 0; index < count; index++) ...[
            if (index > 0) const Gap(Spacings.xsmall),
            _dot(context, index),
          ],
        ],
      ),
    );
  }

  Widget _dot(BuildContext context, int index) {
    final palette = context.palette;
    final isActive = index == current;
    final hideAnimation = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    final dot = AnimatedContainer(
      duration: hideAnimation ? Duration.zero : duration,
      curve: Curves.easeOut,
      width: isActive ? activeDotWidth : dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: isActive
            ? (activeColor ?? palette.primary)
            : (inactiveColor ?? palette.onBackground.withValues(alpha: 0.25)),
        borderRadius: BorderRadius.circular(dotSize / 2),
      ),
    );

    final dotLabel = dotLabelBuilder?.call(index);
    if (onSelected == null && dotLabel == null) return dot;
    if (onSelected == null) return Semantics(label: dotLabel, container: true, child: dot);

    return Semantics(
      label: dotLabel,
      container: true,
      button: true,
      selected: isActive,
      child: BaseTapper(
        onTap: () => onSelected!(index),
        child: SizedBox.square(
          dimension: selectionTargetSize,
          child: Center(child: dot),
        ),
      ),
    );
  }
}
