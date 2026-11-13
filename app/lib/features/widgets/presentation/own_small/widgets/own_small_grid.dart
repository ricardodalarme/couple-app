import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// 2x2 grid of the four small personal widgets (`X-146`):
/// Anotar slip, Próxima data, Humor, and Ritual.
class const OwnSmallWidgetsGrid({
  required final WidgetPayload payload,
  required final bool isDarkPreview,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.widgets;
    final now = clock.now();

    if (!payload.isSignedIn) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.signedOutLabel,
        title: l10n.signedOutBody,
        subtitle: l10n.ownIdeaHint,
        isDark: isDarkPreview,
        deepLinkUri: Uri.parse('repara://sign-in'),
      );
    }

    final daysUntilDate = payload.daysUntilNextDateOn(now);
    final dateTitle = switch ((payload.discreet, daysUntilDate)) {
      (true, _) => l10n.discreetReminderLabel,
      (false, final days?) => l10n.ownSmallDateDays(count: days),
      (false, null) => l10n.ownSmallDateDefaultTitle,
    };
    final dateSubtitle = payload.discreet
        ? l10n.discreetNeutralBody
        : (payload.nextDateTitle ?? l10n.ownIdeaHint);

    final ritualTitle = payload.discreet
        ? l10n.discreetReminderLabel
        : (payload.ritualTitle ?? l10n.ownSmallRitualDefaultTitle);
    final ritualSubtitle = payload.discreet
        ? l10n.discreetNeutralBody
        : (payload.ritualSchedule ?? l10n.ownSmallRitualDefaultTime);

    final moodTitle = payload.discreet ? l10n.discreetReminderLabel : l10n.ownSmallMoodPrompt;
    final moodSubtitle = payload.discreet ? l10n.discreetNeutralBody : l10n.ownSmallMoodOptions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WidgetSurfacePreview(
                categoryLabel: l10n.ownSlipLabel,
                title: payload.discreet ? l10n.discreetReminderLabel : l10n.ownSlipTitle,
                subtitle: payload.discreet ? l10n.discreetNeutralBody : l10n.ownSlipSubtitle,
                badgeText: payload.discreet ? null : l10n.ownSmallSlipAction,
                isDark: isDarkPreview,
                deepLinkUri: Uri.parse('repara://capture'),
              ),
            ),
            const SizedBox(width: AppSpace.s12),
            Expanded(
              child: WidgetSurfacePreview(
                categoryLabel: l10n.ownSmallDateDefaultTitle,
                title: dateTitle,
                subtitle: dateSubtitle,
                isDark: isDarkPreview,
                deepLinkUri: Uri.parse('repara://dates'),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: WidgetSurfacePreview(
                categoryLabel: l10n.ownSmallMoodLabel,
                title: moodTitle,
                subtitle: moodSubtitle,
                isDark: isDarkPreview,
                deepLinkUri: Uri.parse('repara://mood'),
              ),
            ),
            const SizedBox(width: AppSpace.s12),
            Expanded(
              child: WidgetSurfacePreview(
                categoryLabel: l10n.ownSmallRitualLabel,
                title: ritualTitle,
                subtitle: ritualSubtitle,
                isDark: isDarkPreview,
                deepLinkUri: Uri.parse('repara://rituals'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
