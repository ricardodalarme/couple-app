import 'package:design_system/design_system.dart';

const double _chipHeight = 38;
const double _horizontalPadding = 15;
const double _iconSize = 15;
const double _iconGap = 6;
const double _textSize = 15;

/// A single- or multi-select chip.
class const BaseChoiceChip({
  required final String label,
  final bool isSelected = false,
  final VoidCallback? onTap,
  final IconData? icon,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ink = isSelected ? colors.accentOnSoft : colors.textPrimary;

    final chip = Container(
      constraints: const BoxConstraints(minHeight: _chipHeight),
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      decoration: BoxDecoration(
        color: isSelected ? colors.accentSoft : colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: isSelected ? null : Border.all(color: colors.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            AppIcon(icon: icon!, size: _iconSize, color: ink),
            const SizedBox(width: _iconGap),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.bodySm.copyWith(
                fontSize: _textSize,
                fontWeight: FontWeight.w500,
                color: ink,
              ),
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return chip;

    return AppPressable(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      enforceMinTapTarget: true,
      isSelected: isSelected,
      child: chip,
    );
  }
}
