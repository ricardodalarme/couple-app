import 'package:flutter/widgets.dart';
import 'package:ui/src/icons/app_icon.dart';
import 'package:ui/src/theme/app_theme.dart';
import 'package:ui/src/tokens/tokens.dart';

/// The filled icon plus upper-case label that opens a list card.
class const BaseCategoryLabel({
  required final String text,
  required final AppCategory category,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ink = category.labelColor(context.colors);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(icon: _iconFor(category), color: ink),
        const SizedBox(width: AppSpace.s8),
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
