import 'package:design_system/design_system.dart';

/// A section title with an optional trailing link.
///
/// The caller owns the vertical spacing. Set [isLabel] for an uppercase group
/// label, or [showsLock] for a privacy line.
class const BaseSectionHeader({
  required final String title,
  final String? actionLabel,
  final VoidCallback? onAction,
  final bool isLabel = false,
  final bool showsLock = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final action = actionLabel;
    final hasAction = action != null && onAction != null;
    final titleStyle = isLabel
        ? context.text.label.copyWith(color: colors.textSecondary)
        : context.text.titleSm.copyWith(color: colors.textPrimary);
    final label = isLabel ? title.toUpperCase() : title;

    return Semantics(
      header: true,
      child: Row(
        children: [
          Expanded(
            flex: hasAction ? 3 : 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showsLock) ...[
                  AppIcon(
                    icon: AppIcons.lock,
                    size: AppIconSize.xs,
                    color: isLabel ? colors.textSecondary : colors.iconMuted,
                  ),
                  const SizedBox(width: AppSpace.s6),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: titleStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
          if (hasAction) ...[
            const SizedBox(width: AppSpace.s12),
            Flexible(
              flex: 2,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: BaseTextLink(text: action, onPressed: onAction),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
