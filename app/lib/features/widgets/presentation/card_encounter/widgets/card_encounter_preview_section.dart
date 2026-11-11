import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const CardEncounterPreviewSection({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;

    if (payload.discreet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            isDark: isDarkPreview,
            categoryLabel: l10n.discreetReminderLabel,
            title: l10n.discreetNeutralBody,
            subtitle: l10n.lockScreenPrivacyRule,
            onTapOverride: () => context.pushRoute(const DiscreetModeRoute()),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseNote(text: l10n.discreetBanner, icon: AppIcons.eye_off),
        ],
      );
    }

    if (!payload.isPaired) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            isDark: isDarkPreview,
            categoryLabel: l10n.cardEncounterLabel,
            title: l10n.unpairedBanner,
            subtitle: l10n.ownIdeaHint,
            onTapOverride: () => context.pushRoute(const InviteRoute()),
          ),
        ],
      );
    }

    final now = DateTime.now();
    final isPaused = payload.isPauseActiveOn(now);
    final (cardTitle, cardSubtitle) = switch ((isPaused, payload.cardState)) {
      (true, _) => (l10n.cardPauseTitle, l10n.cardPauseSubtitle),
      (false, 'ready') => (l10n.cardReadyTitle, l10n.cardReadySubtitle),
      (false, 'sent') => (l10n.cardSentTitle, l10n.cardSentSubtitle),
      _ => (l10n.cardNoneTitle, l10n.cardNoneSubtitle),
    };

    final daysUntilDate = payload.daysUntilNextDateOn(now);
    final encounterTitle = daysUntilDate != null
        ? l10n.ownSmallDateDays(count: daysUntilDate)
        : l10n.nextEncounterEmptyTitle;
    final encounterSubtitle = daysUntilDate != null && (payload.nextDateTitle?.isNotEmpty ?? false)
        ? payload.nextDateTitle!
        : l10n.nextEncounterEmptySubtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WidgetSurfacePreview(
                isDark: isDarkPreview,
                categoryLabel: l10n.cardWeeklyLabel,
                title: cardTitle,
                subtitle: cardSubtitle,
                onTapOverride: () =>
                    context.pushRoute(isPaused ? const PauseRoute() : const SundayCardRoute()),
              ),
            ),
            const SizedBox(width: AppSpace.s12),
            Expanded(
              child: WidgetSurfacePreview(
                isDark: isDarkPreview,
                categoryLabel: l10n.nextEncounterLabel,
                title: encounterTitle,
                subtitle: encounterSubtitle,
                onTapOverride: () => context.pushRoute(const DatesRoute()),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s16),
        BaseNote(text: l10n.cardEncounterPrivacyNote, icon: AppIcons.shield),
      ],
    );
  }
}
