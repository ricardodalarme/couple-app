import 'package:common_ui/common_ui.dart';

class FeedbackIndicator extends StatelessWidget {
  const FeedbackIndicator({required this.title, super.key, this.message});

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: context.typography.titleMedium),
          if (message != null && message!.trim().isNotEmpty) ...[
            const Gap(Spacings.medium),
            Text(message!, textAlign: TextAlign.center, style: context.typography.bodyMedium),
          ],
        ],
      ),
    );
  }
}
