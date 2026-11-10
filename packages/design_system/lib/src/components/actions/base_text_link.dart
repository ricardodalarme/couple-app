import 'package:design_system/design_system.dart';

/// A small text link aligned to a section title.
///
/// Set [isInformational] for non-tappable text.
class const BaseTextLink({
  required final String text,
  final VoidCallback? onPressed,
  final bool isInformational = false,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = context.text.bodySm.copyWith(color: context.colors.textSecondary);
    final Widget label = Text(text, style: style);

    if (isInformational) return label;

    return AppPressable(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      enforceMinTapTarget: true,
      child: label,
    );
  }
}
