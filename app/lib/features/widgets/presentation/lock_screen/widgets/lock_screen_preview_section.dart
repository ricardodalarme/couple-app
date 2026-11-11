import 'dart:io';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// Lock-screen widget preview (`X-148`): shows only a symbol and generic phrase,
/// never a name, personal message, pause status, or time.
class const LockScreenPreviewSection({required final WidgetPayload payload, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final colors = context.colors;

    final title = payload.discreet ? l10n.lockScreenDiscreetPhrase : l10n.lockScreenGenericPhrase;
    final subtitle = payload.discreet ? l10n.discreetNeutralBody : l10n.lockScreenDefault;
    final deepLink = !payload.isSignedIn
        ? 'repara://sign-in'
        : (payload.discreet
              ? 'repara://settings/discreet'
              : (!payload.onLockScreen ? 'repara://settings/widgets' : 'repara://today'));

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
                  title: title,
                  subtitle: subtitle,
                  deepLinkUri: Uri.parse(deepLink),
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
              title: title,
              subtitle: subtitle,
              icon: payload.discreet ? AppIcons.eye_off : AppIcons.moon,
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        BaseNote(text: l10n.lockScreenPrivacyRule),
        if (!payload.onLockScreen) ...[
          const SizedBox(height: AppSpace.s8),
          BaseNote(text: l10n.lockScreenDisabledNote, icon: AppIcons.info),
        ],
        const SizedBox(height: AppSpace.s8),
        BaseNote(
          text: Platform.isAndroid ? l10n.howToAddAndroidLockNote : l10n.howToAddIosLockNote,
          icon: AppIcons.info,
        ),
      ],
    );
  }
}
