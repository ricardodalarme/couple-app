import 'package:design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

/// The tone of a [BaseBanner].
///
/// The four status tones paint their own surface. [plain] and [notice] stay on
/// the card surface; [notice] uses the warning ink for its glyph.
enum BaseBannerVariant() {
  info,
  warning,
  error,
  safety,
  plain,
  notice,
}

/// An inline notice that scrolls with the content.
///
/// The tone selects the status ink and surface; every string comes from the caller.
/// The action sits on its own row below the text so it never breaks mid-word.
class const BaseBanner({
  required final String text,
  final String? title,
  final BaseBannerVariant variant = BaseBannerVariant.info,
  final IconData? icon,
  final String? actionLabel,
  final VoidCallback? onAction,
  final VoidCallback? onDismiss,
  final String? dismissLabel,
  super.key,
}) extends StatelessWidget {
  AppStatus? get _status => switch (variant) {
    .info => AppStatus.info,
    .warning => AppStatus.warning,
    .error => AppStatus.error,
    .safety => AppStatus.safety,
    .plain || .notice => null,
  };

  IconData get _defaultIcon => switch (variant) {
    .info => AppIcons.info,
    .warning || .notice => AppIcons.warning,
    .error => AppIcons.warning,
    .safety => AppIcons.shield,
    .plain => AppIcons.info,
  };

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final status = _status;
    final isQuiet = status == null;
    final surface = isQuiet ? colors.bgSurface : status.surfaceColor(colors);
    final ink = isQuiet ? colors.textPrimary : status.inkColor(colors);
    final iconColor = switch (variant) {
      .plain => colors.accentLabel,
      .notice => AppStatus.warning.inkColor(colors),
      _ => ink,
    };
    final bannerTitle = title;
    final action = actionLabel;
    final dismiss = onDismiss;
    final hasAction = action != null && onAction != null;

    return Semantics(
      container: true,
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(AppRadius.xxl),
          border: isQuiet ? AppBorders.hair(colors.borderDefault) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.s16, vertical: AppSpace.s14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppSpace.s2),
                child: AppIcon(icon: icon ?? _defaultIcon, color: iconColor),
              ),
              const SizedBox(width: AppSpace.s12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (bannerTitle != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpace.s2),
                        child: Text(
                          bannerTitle,
                          style: context.text.bodySm.copyWith(
                            color: ink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    Text(text, style: context.text.caption.copyWith(color: ink)),
                    if (hasAction) ...[
                      const SizedBox(height: AppSpace.s8),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: AppPressable(
                          onTap: onAction,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          enforceMinTapTarget: true,
                          child: Text(
                            action,
                            textAlign: TextAlign.end,
                            style: context.text.bodySm.copyWith(
                              color: ink,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (dismiss != null) ...[
                const SizedBox(width: AppSpace.s8),
                Padding(
                  padding: const EdgeInsets.only(top: AppSpace.s2),
                  child: AppPressable(
                    onTap: dismiss,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    semanticLabel: dismissLabel ?? _closeLabel(context),
                    enforceMinTapTarget: true,
                    child: AppIcon(icon: AppIcons.close, color: ink),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String? _closeLabel(BuildContext context) =>
      Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.closeButtonLabel;
}
