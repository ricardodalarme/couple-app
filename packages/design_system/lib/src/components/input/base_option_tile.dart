import 'package:design_system/design_system.dart';

const double _tileRadius = 18;
const double _tileMinHeight = 56;
const double _tileHorizontalPadding = 16;
const double _tileVerticalPadding = 14;
const double _tileGap = 12;
const double _supportGap = 2;

/// A selectable row with a title, optional support text and a leading visual.
///
/// The trailing control is a radio or checkbox; selection reports through
/// [onTap].
class const BaseOptionTile({
  required final String title,
  final String? support,
  final Widget? leading,
  final bool isSelected = false,
  final VoidCallback? onTap,
  final BaseOptionTileControl control = BaseOptionTileControl.radio,
  final String? semanticLabel,
  final bool isEnabled = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final card = Container(
      constraints: const BoxConstraints(minHeight: _tileMinHeight),
      padding: const EdgeInsets.symmetric(
        horizontal: _tileHorizontalPadding,
        vertical: _tileVerticalPadding,
      ),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(_tileRadius),
        border: Border.all(
          color: isSelected ? colors.borderSelected : colors.borderDefault,
          width: isSelected ? AppBorder.selected : AppBorder.hair,
        ),
        boxShadow: isSelected ? AppShadows.selected : null,
      ),
      child: Row(
        spacing: _tileGap,
        children: [
          ?leading,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.text.body.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colors.textPrimary,
                  ),
                ),
                if (support != null) ...[
                  const SizedBox(height: _supportGap),
                  Text(support!, style: context.text.caption.copyWith(color: colors.textSecondary)),
                ],
              ],
            ),
          ),
          ExcludeSemantics(
            child: switch (control) {
              .radio => BaseRadio(isSelected: isSelected),
              .checkbox => BaseCheckbox(value: isSelected),
            },
          ),
        ],
      ),
    );

    final semantics = Semantics(
      label: semanticLabel ?? title,
      selected: isSelected,
      enabled: isEnabled,
      child: ExcludeSemantics(child: card),
    );

    if (onTap == null) return semantics;

    return Semantics(
      label: semanticLabel ?? title,
      selected: isSelected,
      enabled: isEnabled,
      child: AppPressable(
        onTap: onTap,
        isEnabled: isEnabled,
        borderRadius: BorderRadius.circular(_tileRadius),
        isSelected: isSelected,
        enforceMinTapTarget: true,
        child: ExcludeSemantics(child: card),
      ),
    );
  }
}

/// The selection control shown at the end of a [BaseOptionTile].
enum BaseOptionTileControl() {
  /// A single-choice radio circle.
  radio,

  /// A multiple-choice checkbox.
  checkbox,
}
