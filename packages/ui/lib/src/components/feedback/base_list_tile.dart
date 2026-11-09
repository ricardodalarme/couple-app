import 'package:ui/ui.dart';

/// Minimum row height from the list spec.
const double _minHeight = 60;

/// Side of the square icon tile.
const double _tileSize = 32;

/// One line of a settings, slips or dates list.
class const BaseListTile({
  required final String title,
  final String? subtitle,
  final IconData? icon,
  final Widget? leading,
  final String? value,
  final bool showsChevron = false,
  final bool isDestructive = false,
  final Widget? trailing,
  final Widget? control,
  final bool isLoose = false,
  final VoidCallback? onTap,
  final bool isEnabled = true,
  final bool showsDivider = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(isLoose ? AppRadius.xxl : 0);

    return AppPressable(
      onTap: onTap,
      isEnabled: isEnabled,
      borderRadius: radius,
      isSemanticButton: onTap != null,
      child: ClipRRect(
        borderRadius: radius,
        child: ColoredBox(
          color: colors.bgSurface,
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: _minHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.s16,
                    vertical: AppSpace.s10,
                  ),
                  child: Row(
                    children: [
                      if (leading != null) ...[
                        leading!,
                        const SizedBox(width: AppSpace.s12),
                      ] else if (icon != null) ...[
                        _iconTile(colors, icon!),
                        const SizedBox(width: AppSpace.s12),
                      ],
                      Expanded(child: _textBlock(context)),
                      if (value != null || trailing != null || control != null || showsChevron) ...[
                        const SizedBox(width: AppSpace.s12),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (value != null)
                              Flexible(
                                child: Text(
                                  value!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style: context.text.bodySm.copyWith(color: colors.textSecondary),
                                ),
                              ),
                            if (trailing != null) ...[
                              const SizedBox(width: AppSpace.s12),
                              trailing!,
                            ],
                            if (control != null) ...[const SizedBox(width: AppSpace.s12), control!],
                            if (showsChevron) ...[
                              const SizedBox(width: AppSpace.s8),
                              AppIcon(icon: AppIcons.chevron_right, color: colors.iconMuted),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (showsDivider)
                Positioned(
                  top: 0,
                  left: AppSpace.s16,
                  right: 0,
                  child: SizedBox(
                    height: AppBorder.hair,
                    child: ColoredBox(color: colors.borderDefault),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconTile(AppColors colors, IconData name) {
    return Container(
      width: _tileSize,
      height: _tileSize,
      decoration: BoxDecoration(
        color: colors.accentSoft,
        borderRadius: BorderRadius.circular(AppSpace.s10),
      ),
      alignment: Alignment.center,
      child: AppIcon(icon: name, size: AppIconSize.sm, color: colors.accentLabel),
    );
  }

  Widget _textBlock(BuildContext context) {
    final colors = context.colors;
    final subtitle = this.subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.text.body.copyWith(
            color: isDestructive ? AppPalette.errorInk : colors.textPrimary,
          ),
        ),
        if (subtitle != null)
          Text(subtitle, style: context.text.caption.copyWith(color: colors.textSecondary)),
      ],
    );
  }
}
