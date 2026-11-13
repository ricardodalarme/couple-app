import 'package:auto_route/auto_route.dart';
import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/shared/widget_surface_preview.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

class const CoupleCounterPreviewCards({
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

    if (payload.discreet) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.coupleCounterLabel,
        title: l10n.discreetReminderLabel,
        subtitle: l10n.discreetNeutralBody,
        isDark: isDarkPreview,
        deepLinkUri: Uri.parse('repara://settings/discreet'),
      );
    }

    if (!payload.isPaired) {
      return WidgetSurfacePreview(
        categoryLabel: l10n.coupleCounterLabel,
        title: l10n.statesUnpairedTitle,
        subtitle: l10n.unpairedBanner,
        badgeText: l10n.statesUnpairedAction,
        isDark: isDarkPreview,
        onTapOverride: () => context.pushRoute(const InviteRoute()),
      );
    }

    final breakdown = payload.durationBreakdownOn(now);
    if (breakdown == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetSurfacePreview(
            categoryLabel: l10n.coupleCounterLabel,
            title: l10n.coupleCounterUnset,
            subtitle: l10n.ownIdeaHint,
            isDark: isDarkPreview,
            onTapOverride: () => context.pushRoute(const RelationshipRoute()),
          ),
          const SizedBox(height: AppSpace.s12),
          BaseButton(
            text: l10n.counterSetDateAction,
            variant: BaseButtonVariant.secondary,
            onPressed: () => context.pushRoute(const RelationshipRoute()),
          ),
        ],
      );
    }

    final phaseLabel = switch (payload.relationshipPhase) {
      'living_together' => l10n.counterStatusLivingTogether,
      'married' => l10n.counterStatusMarried,
      'dating' => l10n.counterStatusDating,
      _ => l10n.counterStatusTogether,
    };

    final mediumTitle = l10n.counterYearsMonthsTitle(
      years: breakdown.years,
      months: breakdown.months,
    );
    final mediumSubtitle = switch ((payload.showNames, payload.partnerName)) {
      (true, final name?) when name.isNotEmpty =>
        '${l10n.counterMonthsDaysSubtitle(months: breakdown.months, days: breakdown.days)} · $name',
      _ => l10n.counterMonthsDaysSubtitle(months: breakdown.months, days: breakdown.days),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WidgetSurfacePreview(
          categoryLabel: l10n.coupleCounterLabel,
          title: mediumTitle,
          subtitle: mediumSubtitle,
          isDark: isDarkPreview,
          deepLinkUri: Uri.parse('repara://today'),
        ),
        const SizedBox(height: AppSpace.s12),
        WidgetSurfacePreview(
          categoryLabel: phaseLabel,
          title: l10n.coupleCounterDays(count: breakdown.totalDays),
          subtitle: l10n.ownIdeaHint,
          isDark: isDarkPreview,
          deepLinkUri: Uri.parse('repara://today'),
        ),
        const SizedBox(height: AppSpace.s12),
        BaseNote(text: l10n.counterMidnightNote, icon: AppIcons.clock),
      ],
    );
  }
}
