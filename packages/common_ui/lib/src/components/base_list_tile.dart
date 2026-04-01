import 'package:common_ui/common_ui.dart';
import 'package:common_ui/src/theme/palette.dart';

class BaseListTile extends StatelessWidget {
  const BaseListTile({
    required this.title,
    this.onTap,
    this.leading,
    this.subtitle,
    this.trailing,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  static const double _iconSize = 22;

  @override
  Widget build(BuildContext context) {
    final Palette palette = context.palette;
    final Typography typography = context.typography;

    return BaseTapper(
      onTap: onTap,
      backgroundColor: palette.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.large, vertical: Spacings.medium),
        child: Row(
          children: [
            if (leading != null) ...[
              IconTheme(
                data: IconThemeData(color: palette.onBackground, size: _iconSize),
                child: leading!,
              ),
              const Gap(Spacings.large),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: typography.labelMedium),
                  if (subtitle != null) ...[
                    const Gap(Spacings.xxxsmall),
                    Text(subtitle!, style: typography.bodyMedium),
                  ],
                ],
              ),
            ),
            if (trailing != null) ...[
              const Gap(Spacings.medium),
              IconTheme(
                data: const IconThemeData(size: _iconSize),
                child: trailing!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
