import 'package:design_system/design_system.dart';

const double _trackHeight = 46;
const double _trackRadius = 22;
const double _trackPadding = 4;
const double _segmentGap = 2;
const double _segmentHeight = 38;
const double _segmentRadius = 18;
const double _segmentPadding = 8;

/// A two-to-four segment single-choice control.
///
/// Reports the tapped index through [onSelectionChanged].
class const BaseSegmented({
  required final List<String> segments,
  required final int selectedIndex,
  required final ValueChanged<int> onSelectionChanged,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final activeIndex = selectedIndex.clamp(0, segments.isEmpty ? 0 : segments.length - 1);

    return Semantics(
      label: semanticLabel,
      child: Container(
        constraints: const BoxConstraints(minHeight: _trackHeight),
        padding: const EdgeInsets.symmetric(horizontal: _trackPadding),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(_trackRadius),
          border: Border.all(color: colors.borderDefault),
        ),
        child: Row(
          spacing: _segmentGap,
          children: [
            for (var index = 0; index < segments.length; index++)
              Expanded(
                child: AppPressable(
                  onTap: () => onSelectionChanged(index),
                  borderRadius: BorderRadius.circular(_segmentRadius),
                  isSelected: index == activeIndex,
                  child: SizedBox(
                    height: _trackHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: (_trackHeight - _segmentHeight) / 2,
                      ),
                      child: AnimatedContainer(
                        duration: context.motionDuration(AppMotion.fast),
                        curve: AppMotion.fastCurve,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: _segmentPadding),
                        decoration: BoxDecoration(
                          color: index == activeIndex ? colors.accentSoft : null,
                          borderRadius: BorderRadius.circular(_segmentRadius),
                        ),
                        child: Text(
                          segments[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: context.text.bodySm.copyWith(
                            fontWeight: index == activeIndex ? FontWeight.w600 : FontWeight.w500,
                            color: index == activeIndex ? colors.accentLabel : colors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
