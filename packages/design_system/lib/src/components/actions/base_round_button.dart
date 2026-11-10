import 'package:design_system/design_system.dart';

const double _buttonSide = 40;

/// A 40 × 40 round icon button for app bars, back and close actions.
class const BaseRoundButton({
  required final IconData icon,
  required final VoidCallback? onPressed,
  final String? semanticLabel,
  final bool isEnabled = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppPressable(
      onTap: onPressed,
      isEnabled: isEnabled && onPressed != null,
      semanticLabel: semanticLabel,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      enforceMinTapTarget: true,
      child: SizedBox(
        width: _buttonSide,
        height: _buttonSide,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.bgSurface,
            border: AppBorders.hair(colors.borderDefault),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: AppIcon(icon: icon, color: colors.iconDefault),
          ),
        ),
      ),
    );
  }
}
