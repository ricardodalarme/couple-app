import 'package:common_ui/common_ui.dart';

class TextDivider extends StatelessWidget {
  const TextDivider(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacings.medium),
          child: Text(text, style: context.typography.bodySmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
