import 'package:ui/ui.dart';

/// A small text link that sits on the baseline of a section title.
///
/// When [isInformational] is true the text carries no tap and simply states a
/// fact, such as "only you see this".
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
