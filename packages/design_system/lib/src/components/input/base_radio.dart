import 'package:design_system/design_system.dart';

const double _radioSize = 24;
const double _checkSize = 14;

/// A 24pt radio circle.
///
/// The target is 44pt when [onTap] is supplied.
class const BaseRadio({
  required final bool isSelected,
  final VoidCallback? onTap,
  final String? semanticLabel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final circle = Container(
      width: _radioSize,
      height: _radioSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? colors.actionPrimary : null,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? colors.actionPrimary : AppPalette.neutral200,
          width: AppBorder.selected,
        ),
      ),
      child: isSelected
          ? AppIcon(icon: AppIcons.check, size: _checkSize, color: colors.textOnAction)
          : null,
    );

    if (onTap != null) {
      return AppPressable(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_radioSize / 2),
        semanticLabel: semanticLabel,
        enforceMinTapTarget: true,
        isSelected: isSelected,
        child: circle,
      );
    }
    if (semanticLabel == null) return circle;

    return Semantics(label: semanticLabel, selected: isSelected, child: circle);
  }
}
