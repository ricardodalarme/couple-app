import 'package:common_ui/src/extensions/build_context_extension.dart';
import 'package:common_ui/src/tokens/spacings.dart';
import 'package:flutter/widgets.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({this.startMargin = Spacings.none, this.endMargin = Spacings.none, super.key})
    : text = null;

  const BaseDivider.text({
    required String this.text,
    this.startMargin = Spacings.none,
    this.endMargin = Spacings.none,
    super.key,
  });

  final double startMargin;
  final double endMargin;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: startMargin, bottom: endMargin),
      child: text == null ? const BaseDividerLine() : _BaseDividerWithText(text: text!),
    );
  }
}

@visibleForTesting
class BaseDividerLine extends StatelessWidget {
  const BaseDividerLine({super.key});

  static const double _borderWidth = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.palette.onBackground, width: _borderWidth),
        ),
      ),
    );
  }
}

class _BaseDividerWithText extends StatelessWidget {
  const _BaseDividerWithText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: BaseDividerLine()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacings.small),
          child: Text(text, style: context.typography.bodySmall),
        ),
        const Expanded(child: BaseDividerLine()),
      ],
    );
  }
}
