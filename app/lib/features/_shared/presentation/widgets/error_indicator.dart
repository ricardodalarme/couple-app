import 'package:common_ui/common_ui.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
    super.key,
  });

  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacings.large),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center, style: context.typography.titleMedium),
            const Gap(Spacings.medium),
            Text(message, textAlign: TextAlign.center, style: context.typography.bodyMedium),
            const Gap(Spacings.large),
            BaseButton(text: buttonText, onPressed: onButtonPressed),
          ],
        ),
      ),
    );
  }
}
