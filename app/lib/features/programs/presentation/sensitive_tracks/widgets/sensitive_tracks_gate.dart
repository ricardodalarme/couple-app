import 'package:design_system/design_system.dart';

/// Closes a sensitive track until the person records the dedicated consent.
class const SensitiveTracksGate({
  required final String heading,
  required final String title,
  required final String text,
  required final String actionText,
  required final String cancelText,
  required final VoidCallback onAction,
  required final VoidCallback onCancel,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(heading, style: context.text.titleXl),
        const SizedBox(height: AppSpace.s8),
        Text(title, style: context.text.titleSm.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpace.s16),
        BaseSurfaceCard(
          child: Text(text, style: context.text.bodySm.copyWith(color: colors.textSecondary)),
        ),
        const SizedBox(height: AppSpace.s24),
        BaseButton.primary(text: actionText, onPressed: onAction),
        const SizedBox(height: AppSpace.s10),
        BaseButton.secondary(text: cancelText, isFullWidth: true, onPressed: onCancel),
      ],
    );
  }
}
