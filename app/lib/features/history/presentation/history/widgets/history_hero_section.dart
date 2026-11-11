import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HistoryHeroSection({
  required final HistoryOverview overview,
  required final VoidCallback onAvatarTap,
  required final VoidCallback onDatesTap,
  required final VoidCallback onDifferentDatesTap,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final colors = context.colors;
    final text = context.text;
    final togetherSince = overview.togetherSince;
    final reunionDays = overview.isOngoing ? overview.daysUntilReunion(DateTime.now()) : null;

    final String headline;
    if (overview.phase == RelationshipPhase.beginning ||
        overview.phase == RelationshipPhase.restarting ||
        (!overview.isPaired && togetherSince == null)) {
      headline = l10n.beginningHeadline;
    } else if (overview.phase == RelationshipPhase.longDistance && reunionDays != null) {
      headline = l10n.reunionCountdown(days: reunionDays);
    } else if (togetherSince != null) {
      headline = HistoryDateFormatter.formatDurationHeadline(l10n, overview.numbers);
    } else {
      headline = l10n.beginningHeadline;
    }

    return Column(
      children: [
        const SizedBox(height: AppSpace.s6),
        Center(
          child: BaseAvatarPair(
            size: 64,
            selfInitials: overview.selfInitials,
            partnerInitials: overview.partnerInitials,
            onTap: onAvatarTap,
            semanticLabel: l10n.avatarAction,
          ),
        ),
        const SizedBox(height: AppSpace.s18),
        Text(
          headline,
          textAlign: TextAlign.center,
          style: text.display.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: AppSpace.s6),
        if (togetherSince != null)
          AppPressable(
            onTap: onDatesTap,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.s10, vertical: AppSpace.s4),
              child: Text(
                l10n.togetherSinceLine(
                  date: HistoryDateFormatter.formatFullDate(l10n, togetherSince),
                ),
                textAlign: TextAlign.center,
                style: text.bodySm.copyWith(color: colors.textSecondary),
              ),
            ),
          )
        else
          BaseTextLink(text: l10n.setStartDate, onPressed: onDatesTap),
        if (overview.storyDates.hasDifferentStartDates) ...[
          const SizedBox(height: AppSpace.s12),
          BaseBanner(
            text: l10n.differentDatesBanner,
            actionLabel: l10n.differentDatesAction,
            onAction: onDifferentDatesTap,
          ),
        ],
      ],
    );
  }
}
