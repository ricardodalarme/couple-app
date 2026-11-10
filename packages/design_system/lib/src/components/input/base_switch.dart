import 'package:design_system/design_system.dart';

const double _trackWidth = 51;
const double _trackHeight = 31;
const double _thumbSize = 27;
const double _thumbInset = 2;

/// A 51 × 31 switch.
///
/// The track uses `action.primary` when on and `neutral.150` when off.
class const BaseSwitch({
  required final bool value,
  required final ValueChanged<bool> onChanged,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      toggled: value,
      label: semanticLabel,
      child: AppPressable(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        enforceMinTapTarget: true,
        isSemanticButton: false,
        child: AnimatedContainer(
          width: _trackWidth,
          height: _trackHeight,
          duration: context.motionDuration(AppMotion.fast),
          curve: AppMotion.fastCurve,
          decoration: BoxDecoration(
            color: value ? colors.actionPrimary : AppPalette.neutral150,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                duration: context.motionDuration(AppMotion.fast),
                curve: AppMotion.fastCurve,
                child: Padding(
                  padding: const EdgeInsets.all(_thumbInset),
                  child: Container(
                    width: _thumbSize,
                    height: _thumbSize,
                    decoration: BoxDecoration(
                      color: colors.bgSurface,
                      shape: BoxShape.circle,
                      boxShadow: AppShadows.face,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
