import 'package:ui/ui.dart';

const double _barWidth = 18;
const double _barHeight = 4;
const double _barGap = 5;

/// The progress dashes shown at the top of a guided flow.
///
/// Completed and current steps use the primary action ink; the remaining steps
/// use the neutral track. The default screen-reader label reads
/// "Step 3 of 5".
class const BaseStepper({
  required final int count,
  required final int currentIndex,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      label: semanticLabel ?? 'Step ${currentIndex + 1} of $count',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < count; index++) ...[
            if (index > 0) const SizedBox(width: _barGap),
            SizedBox(
              width: _barWidth,
              height: _barHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: index <= currentIndex ? colors.actionPrimary : AppPalette.neutral150,
                  borderRadius: BorderRadius.circular(_barHeight / 2),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
