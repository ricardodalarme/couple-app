import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Lock-screen widget preview (`X-148`): shows only a symbol and generic phrase,
/// never a name or personal message, and becomes even more neutral in discreet mode.
class const LockScreenPreviewSection({
  required final WidgetPayload payload,
  required final VoidCallback onReadyFromPause,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final colors = context.colors;
    final now = DateTime.now();
    final isPauseActive = payload.isPauseActiveOn(now);
    final timeLabel = payload.pauseUntilTimeLabel();

    final rectangularTitle = switch ((payload.discreet, isPauseActive)) {
      (true, _) => l10n.lockScreenDiscreetPhrase,
      (false, true) => l10n.lockScreenPauseTitle,
      (false, false) => l10n.lockScreenGenericPhrase,
    };

    final rectangularSubtitle = switch ((payload.discreet, isPauseActive, timeLabel)) {
      (true, _, _) => l10n.discreetNeutralBody,
      (false, true, final t?) => l10n.lockScreenPauseUntil(time: t),
      (false, true, null) => l10n.lockScreenPauseUntilDefault,
      (false, false, _) => l10n.lockScreenDefault,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
            border: AppBorders.hair(colors.borderDefault),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpace.s24),
            child: Column(
              children: [
                Text(
                  l10n.lockScreenClockTime,
                  style: context.text.display.copyWith(color: colors.textPrimary),
                ),
                const SizedBox(height: AppSpace.s4),
                Text(
                  l10n.lockScreenClockDate,
                  style: context.text.caption.copyWith(color: colors.textSecondary),
                ),
                const SizedBox(height: AppSpace.s20),
                WidgetSurfacePreview(
                  categoryLabel: l10n.lockScreenLabel,
                  title: rectangularTitle,
                  subtitle: rectangularSubtitle,
                  badgeText: (!payload.discreet && isPauseActive)
                      ? l10n.lockScreenReadyAction
                      : null,
                  deepLinkUri: Uri.parse(
                    payload.discreet
                        ? 'repara://settings/discreet'
                        : (isPauseActive ? 'repara://pause' : 'repara://today'),
                  ),
                  onTapOverride: (!payload.discreet && isPauseActive) ? onReadyFromPause : null,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s16),
        Text(l10n.lockScreenFamiliesTitle, style: context.text.titleSm),
        const SizedBox(height: AppSpace.s8),
        BaseListGroup(
          children: [
            BaseListTile(
              title: rectangularTitle,
              subtitle: rectangularSubtitle,
              icon: payload.discreet ? AppIcons.eye_off : AppIcons.moon,
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        BaseNote(text: l10n.lockScreenPrivacyRule),
        const SizedBox(height: AppSpace.s8),
        BaseNote(text: l10n.howToAddAndroidLockNote, icon: AppIcons.info),
      ],
    );
  }
}
