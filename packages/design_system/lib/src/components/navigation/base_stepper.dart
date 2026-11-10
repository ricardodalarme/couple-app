import 'package:design_system/design_system.dart';
import 'package:design_system/design_system_l10n.dart';

const double _barWidth = 18;
const double _barHeight = 4;
const double _barGap = 5;

/// Progress dashes for a guided flow.
///
/// The default screen-reader label reads "Step 3 of 5".
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
      label:
          semanticLabel ??
          context.designSystemL10nOrBase.navigation.stepOf(current: currentIndex + 1, total: count),
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
