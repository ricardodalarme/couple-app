import 'package:design_system/design_system.dart';

/// A short explanation paired with a decorative line icon.
class const BaseNote({required final String text, final IconData icon = AppIcons.lock, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(icon: icon, size: AppIconSize.sm, color: colors.textPlaceholder),
        const SizedBox(width: AppSpace.s10),
        Flexible(
          child: Text(text, style: context.text.caption.copyWith(color: colors.textSecondary)),
        ),
      ],
    );
  }
}
