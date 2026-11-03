import 'package:common_ui/common_ui.dart';

class const ErrorIndicator({
  required final String title,
  required final String message,
  required final String buttonText,
  required final VoidCallback onButtonPressed,
  super.key,
}) extends StatelessWidget {
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
