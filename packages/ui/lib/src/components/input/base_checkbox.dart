import 'package:ui/ui.dart';

const double _boxSize = 24;
const double _boxRadius = 7;
const double _checkSize = 14;
const double _labelGap = 10;

/// A 24pt checkbox with an optional inline label.
///
/// The box is the visual; when [label] is supplied the whole row is the touch
/// target. [isIndeterminate] paints a dash instead of the check and is exposed
/// to assistive technology as a mixed value.
class const BaseCheckbox({
  required final bool value,
  final bool isIndeterminate = false,
  final String? label,
  final String? semanticLabel,
  final ValueChanged<bool>? onChanged,
  final bool isEnabled = true,
  super.key,
}) extends StatelessWidget {
  bool get _isMarked => value || isIndeterminate;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final box = Container(
      width: _boxSize,
      height: _boxSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _isMarked ? colors.actionPrimary : colors.bgSurface,
        borderRadius: BorderRadius.circular(_boxRadius),
        border: Border.all(
          color: _isMarked ? colors.actionPrimary : AppPalette.neutral200,
          width: AppBorder.selected,
        ),
      ),
      child: _isMarked
          ? AppIcon(
              icon: isIndeterminate ? AppIcons.more : AppIcons.check,
              size: _checkSize,
              color: colors.textOnAction,
            )
          : null,
    );

    final visual = label == null
        ? box
        : LayoutBuilder(
            builder: (context, constraints) {
              final row = Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: _labelGap,
                children: [
                  box,
                  Text(label!, style: context.text.body.copyWith(color: colors.textPrimary)),
                ],
              );

              return constraints.hasBoundedWidth
                  ? SizedBox(width: constraints.maxWidth, child: row)
                  : row;
            },
          );
    final content = ExcludeSemantics(child: visual);

    final semantics = Semantics(
      checked: !isIndeterminate && value,
      mixed: isIndeterminate,
      enabled: isEnabled && onChanged != null,
      label: semanticLabel ?? label,
      child: content,
    );

    if (onChanged == null) return semantics;

    return Semantics(
      checked: !isIndeterminate && value,
      mixed: isIndeterminate,
      enabled: isEnabled,
      label: semanticLabel ?? label,
      child: AppPressable(
        onTap: () => onChanged!(isIndeterminate || !value),
        isEnabled: isEnabled,
        borderRadius: BorderRadius.circular(_boxRadius),
        enforceMinTapTarget: true,
        isSemanticButton: false,
        child: content,
      ),
    );
  }
}
