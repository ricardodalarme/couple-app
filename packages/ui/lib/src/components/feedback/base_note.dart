import 'package:ui/ui.dart';

/// A short, quiet explanation paired with a line icon.
///
/// Used for privacy notes and small clarifications; the icon is decorative and
/// the copy carries the meaning.
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
