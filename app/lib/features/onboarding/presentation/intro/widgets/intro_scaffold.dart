import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';

/// The shared frame of the first-use screens: step dashes, a highlighted title and a footer.
class const IntroScaffold({
  required final int stepIndex,
  required final String title,
  required final String highlight,
  required final String subtitle,
  required final Widget body,
  required final Widget footer,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: BaseAppBar(
        stepIndicator: BaseStepper(count: introStepCount, currentIndex: stepIndex),
      ),
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpace.s12),
            Semantics(
              header: true,
              child: AppHighlightedText(
                text: title,
                highlight: highlight,
                style: context.text.display,
              ),
            ),
            const SizedBox(height: AppSpace.s8),
            Text(subtitle, style: context.text.body.copyWith(color: context.colors.textSecondary)),
            const SizedBox(height: AppSpace.s24),
            body,
          ],
        ),
        footer: footer,
      ),
    );
  }
}

/// The footer of a screen that can be skipped: a quiet skip beside the main action.
class const IntroFooter({
  required final String skipText,
  required final String continueText,
  required final VoidCallback onSkip,
  required final VoidCallback onContinue,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseButton(text: skipText, variant: .text, isFullWidth: false, onPressed: onSkip),
        const SizedBox(width: AppSpace.s12),
        Expanded(
          child: BaseButton(text: continueText, onPressed: onContinue),
        ),
      ],
    );
  }
}
