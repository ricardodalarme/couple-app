import 'package:design_system/src/icons/app_icon.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/tokens/tokens.dart';
import 'package:flutter/widgets.dart';

/// A filled icon with an upper-case label.
///
/// [icon] overrides the category glyph; [showsIcon] hides it.
class const BaseCategoryLabel({
  required final String text,
  required final AppCategory category,
  final IconData? icon,
  final bool showsIcon = true,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ink = category.labelColor(context.colors);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showsIcon) ...[
          AppIcon(icon: icon ?? _iconFor(category), color: ink),
          const SizedBox(width: AppSpace.s8),
        ],
        Flexible(
          child: Text(text.toUpperCase(), style: context.text.label.copyWith(color: ink)),
        ),
      ],
    );
  }
}

IconData _iconFor(AppCategory category) => switch (category) {
  .idea => AppIcons.lightbulb_filled,
  .dates => AppIcons.calendar,
  .invite => AppIcons.user_filled,
  .card => AppIcons.mail,
};
