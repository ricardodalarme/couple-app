import 'package:design_system/design_system.dart';

/// A framed card with the heart envelope, a title and one compact action.
class const ReceivedCard({
  required final String title,
  required final String actionText,
  required final VoidCallback onAction,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      container: true,
      child: AppCardRing(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpace.s18),
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: AppBorders.hair(colors.borderDefault),
          ),
          child: Row(
            children: [
              AppEnvelope(color: colors.accentHighlight),
              const SizedBox(width: AppSpace.s16),
              Expanded(child: Text(title, style: context.text.titleSm)),
              const SizedBox(width: AppSpace.s12),
              BaseButton(
                text: actionText,
                onPressed: onAction,
                variant: BaseButtonVariant.compact,
                isFullWidth: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
