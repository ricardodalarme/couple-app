import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const WidgetStatesPreviewSection({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  required final ValueChanged<bool> onToggleDiscreet,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.statesDiscreetSection,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        WidgetSurfacePreview(
          isDark: isDarkPreview,
          categoryLabel: l10n.discreetReminderLabel,
          title: l10n.discreetNeutralBody,
          subtitle: l10n.lockScreenPrivacyRule,
          onTapOverride: () => context.pushRoute(const DiscreetModeRoute()),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.statesDiscreetToggle,
              control: BaseSwitch(
                value: payload.discreet,
                semanticLabel: l10n.statesDiscreetToggle,
                onChanged: onToggleDiscreet,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s20),
        Text(
          l10n.statesUnpairedSection,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        WidgetSurfacePreview(
          isDark: isDarkPreview,
          categoryLabel: l10n.segmentCouple,
          title: l10n.statesUnpairedTitle,
          subtitle: l10n.unpairedBanner,
          badgeText: l10n.statesUnpairedAction,
          onTapOverride: () => context.pushRoute(const InviteRoute()),
        ),
        const SizedBox(height: AppSpace.s20),
        Text(
          l10n.statesOfflineSection,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        WidgetSurfacePreview(
          isDark: isDarkPreview,
          categoryLabel: l10n.statesOfflineSection,
          title: l10n.statesOfflineTitle,
          subtitle: l10n.statesOfflineSubtitle,
          onTapOverride: () => context.pushRoute(const TodayRoute()),
        ),
        const SizedBox(height: AppSpace.s20),
        Text(
          l10n.signedOutLabel,
          style: context.text.caption.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: AppSpace.s8),
        WidgetSurfacePreview(
          isDark: isDarkPreview,
          categoryLabel: l10n.signedOutLabel,
          title: l10n.signedOutBody,
          subtitle: l10n.lockScreenPrivacyRule,
          onTapOverride: () => context.pushRoute(const SignInRoute()),
        ),
        const SizedBox(height: AppSpace.s16),
        BaseNote(text: l10n.statesPrecedenceNote, icon: AppIcons.shield),
      ],
    );
  }
}
