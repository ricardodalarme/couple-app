import 'package:design_system/design_system.dart';

/// The surface treatment of a [BaseSurfaceCard].
enum BaseSurfaceCardStyle() {
  /// A hairline border on the filled surface.
  bordered,

  /// A soft ring shadow with no border.
  ring,
}

/// A neutral container for grouped content.
///
/// The caller supplies the header and [child]; a surface card never nests
/// another surface card.
class const BaseSurfaceCard({
  final String? title,
  final String? supportText,
  final String? privacyNote,
  final Widget? child,
  final BaseSurfaceCardStyle style = BaseSurfaceCardStyle.bordered,
  final EdgeInsetsGeometry padding = const EdgeInsets.all(AppSpace.s18),
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
        padding: padding,
        decoration: BoxDecoration(
          color: colors.bgSurface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: style == .bordered ? AppBorders.hair(colors.borderDefault) : null,
          boxShadow: style == .ring ? AppShadows.ring : null,
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
