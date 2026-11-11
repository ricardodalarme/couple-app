import 'package:design_system/design_system.dart';

/// Closes a sensitive track until the person records the dedicated consent.
class const SensitiveTracksGate({
  required final String title,
  required final String text,
  required final String actionText,
  required final VoidCallback onAction,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO(review): first-version copy.
    return BaseEmptyState(
      title: title,
      text: text,
      actionText: actionText,
      onAction: onAction,
      face: FaceKind.thinking,
      textMaxLines: null,
    );
  }
}
