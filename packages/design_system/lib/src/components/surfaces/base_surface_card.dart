import 'package:design_system/design_system.dart';

/// A neutral container for grouped content.
///
/// The caller supplies the header and [child]; a surface card never nests
/// another surface card.
class const BaseSurfaceCard({
  final String? title,
  final String? supportText,
  final String? privacyNote,
  final Widget? child,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasHeader = title != null || supportText != null;
    final hasBody = child != null;

    return Semantics(
      container: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpace.s18),
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: AppBorders.hair(colors.borderDefault),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (privacyNote != null) ...[
              _PrivacyNote(text: privacyNote!),
              if (hasHeader || hasBody) const SizedBox(height: AppSpace.s14),
            ],
            if (title != null) Text(title!, style: context.text.titleSm),
            if (supportText != null) ...[
              if (title != null) const SizedBox(height: AppSpace.s4),
              Text(supportText!, style: context.text.caption.copyWith(color: colors.textSecondary)),
            ],
            if (child != null) ...[if (hasHeader) const SizedBox(height: AppSpace.s14), child!],
          ],
        ),
      ),
    );
  }
}

class const _PrivacyNote({required final String text}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppSpace.s2),
          child: AppIcon(icon: AppIcons.lock, size: AppIconSize.xs, color: colors.textSecondary),
        ),
        const SizedBox(width: AppSpace.s6),
        Expanded(
          child: Text(text, style: context.text.caption.copyWith(color: colors.textSecondary)),
        ),
      ],
    );
  }
}
