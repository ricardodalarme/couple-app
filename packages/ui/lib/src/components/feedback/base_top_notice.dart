import 'package:material_ui/material_ui.dart';
import 'package:ui/ui.dart';

/// The fixed tone set for technical notices. Never used for a couple's content.
enum BaseBannerTone() {
  warning,
  error,
  info,
}

/// A dismissible strip above the content for technical notices.
///
/// The tone only chooses the status ink and surface; the copy is always the
/// caller's.
class const BaseTopNotice({
  required final String text,
  final BaseBannerTone tone = BaseBannerTone.warning,
  final IconData icon = AppIcons.wifi_off,
  final VoidCallback? onDismiss,
  super.key,
}) extends StatelessWidget {
  AppStatus get _status => switch (tone) {
    .warning => AppStatus.warning,
    .error => AppStatus.error,
    .info => AppStatus.info,
  };

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final ink = _status.inkColor(colors);
    final dismiss = onDismiss;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _status.surfaceColor(colors),
        borderRadius: BorderRadius.circular(AppRadius.xxl),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpace.s16,
              AppSpace.s12,
              dismiss == null ? AppSpace.s16 : AppIconSize.touch,
              AppSpace.s12,
            ),
            child: Row(
              children: [
                AppIcon(icon: icon, size: AppIconSize.sm, color: ink),
                const SizedBox(width: AppSpace.s10),
                Expanded(
                  child: Text(text, style: context.text.caption.copyWith(color: ink)),
                ),
              ],
            ),
          ),
          if (dismiss != null)
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: AppIconSize.touch,
              child: Center(
                child: AppPressable(
                  onTap: dismiss,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                  semanticLabel: _closeLabel(context),
                  enforceMinTapTarget: true,
                  child: AppIcon(icon: AppIcons.close, color: ink),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String? _closeLabel(BuildContext context) =>
      Localizations.of<MaterialLocalizations>(context, MaterialLocalizations)?.closeButtonLabel;
}
