import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const HistoryNumbersGrid({required final HistoryOverview overview, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final colors = context.colors;
    final text = context.text;
    final numbers = overview.numbers;
    final hasStartDate = overview.togetherSince != null;
    final showsForwardLooking = overview.isOngoing;

    final phaseSuffix = switch (overview.phase) {
      .engaged => l10n.numbersSuffixEngaged,
      .married || .withKids => l10n.numbersSuffixMarried,
      .dating || .livingTogether => l10n.numbersSuffixDating,
      .beginning || .longDistance || .restarting => l10n.numbersSuffixTogether,
    };

    final nextAnniversaryValue = numbers.daysUntilNextAnniversary < 45
        ? l10n.numbersDaysCount(days: numbers.daysUntilNextAnniversary)
        : l10n.numbersMonthsCount(months: numbers.monthsUntilNextAnniversary);
    final nextAnniversaryLabel = l10n.numbersNextAnniversary(
      years: numbers.nextAnniversaryYears,
      suffix: phaseSuffix,
    );
    final recap = numbers.yearRecap;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCardRing(
          child: AppWashSurface(
            wash: AppWash.hero,
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.s24, vertical: AppSpace.s24),
            child: Column(
              children: [
                Text(
                  hasStartDate
                      ? l10n.numbersHeroDays(days: numbers.daysTogether)
                      : l10n.numbersHeroEmpty,
                  textAlign: TextAlign.center,
                  style: (hasStartDate ? text.display : text.titleXl).copyWith(
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpace.s6),
                Text(
                  hasStartDate
                      ? HistoryDateFormatter.formatDurationHeadline(l10n, numbers, inline: true)
                      : l10n.numbersHeroEmptySub,
                  textAlign: TextAlign.center,
                  style: text.bodySm.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpace.s12),
        Row(
          spacing: AppSpace.s10,
          children: [
            Expanded(
              child: _NumberCard(
                value: numbers.weekendsTogether.toString(),
                label: l10n.numbersWeekends(count: numbers.weekendsTogether),
              ),
            ),
            Expanded(
              child: _NumberCard(
                value: numbers.fullMoons.toString(),
                label: l10n.numbersFullMoons(count: numbers.fullMoons),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s10),
        Row(
          spacing: AppSpace.s10,
          children: [
            Expanded(
              child: _NumberCard(
                value: numbers.christmasesTogether.toString(),
                label: l10n.numbersChristmases(count: numbers.christmasesTogether),
              ),
            ),
            if (showsForwardLooking)
              Expanded(
                child: _NumberCard(value: nextAnniversaryValue, label: nextAnniversaryLabel),
              ),
          ],
        ),
        const SizedBox(height: AppSpace.s10),
        Row(
          spacing: AppSpace.s10,
          children: [
            Expanded(
              child: _NumberCard(
                value: numbers.placesCount.toString(),
                label: l10n.numbersPlaces(count: numbers.placesCount),
              ),
            ),
            Expanded(
              child: _NumberCard(
                value: overview.hasMoreMemories
                    ? '${overview.memoryCount}+'
                    : overview.memoryCount.toString(),
                label: l10n.numbersMemoriesRecent(count: overview.memoryCount),
              ),
            ),
          ],
        ),
        if (numbers.places.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.numbersPlacesSection, isLabel: true),
          const SizedBox(height: AppSpace.s10),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final place in numbers.places)
                BaseChoiceChip(label: place, icon: AppIcons.map_pin),
            ],
          ),
        ],
        if (recap != null && (recap.memories > 0 || recap.firsts > 0)) ...[
          const SizedBox(height: AppSpace.s24),
          BaseSectionHeader(title: l10n.numbersYearSection(year: recap.year), isLabel: true),
          const SizedBox(height: AppSpace.s8),
          BaseNote(text: l10n.numbersYearNote),
          const SizedBox(height: AppSpace.s10),
          Row(
            spacing: AppSpace.s10,
            children: [
              Expanded(
                child: _NumberCard(
                  value: recap.memories.toString(),
                  label: l10n.numbersMemoriesCount(count: recap.memories),
                ),
              ),
              Expanded(
                child: _NumberCard(
                  value: recap.firsts.toString(),
                  label: l10n.numbersFirstsCount(count: recap.firsts),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class const _NumberCard({required final String value, required final String label})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    return Container(
      padding: const EdgeInsets.all(AppSpace.s16),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: AppBorders.hair(colors.borderDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: text.titleLg.copyWith(color: colors.textPrimary)),
          const SizedBox(height: AppSpace.s4),
          Text(label, style: text.micro.copyWith(color: colors.textSecondary)),
        ],
      ),
    );
  }
}
