import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_date_formatter.dart';
import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const StoryDatesList({required final HistoryOverview overview, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final state = context.select((StoryDatesCubit cubit) => cubit.state);
    final cubit = context.read<StoryDatesCubit>();
    final dates = overview.storyDates;

    String formatValue(StoryDateEntry entry) {
      if (entry.date == null) return l10n.storyAdd;
      return HistoryDateFormatter.formatMilestoneDate(
        l10n,
        date: entry.date,
        precision: MilestoneDatePrecision.month,
      );
    }

    String? subtitleFor(StoryDateEntry entry) => !entry.isMine && entry.authorName != null
        ? l10n.storyDateAddedBy(name: entry.authorName!)
        : null;

    String titleForKind(String kind) => switch (kind) {
      'met' => l10n.storyMet,
      'dating' => l10n.storyDating,
      'engaged' => l10n.storyEngaged,
      'married' => l10n.storyMarried,
      _ => l10n.storyMet,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseListGroup(
          children: [
            BaseListTile(
              title: l10n.storyMet,
              subtitle: subtitleFor(dates.met),
              value: formatValue(dates.met),
              showsChevron: true,
              onTap: () => cubit.selectKind('met', currentDate: dates.met.date),
            ),
            BaseListTile(
              title: l10n.storyDating,
              subtitle: subtitleFor(dates.dating),
              value: formatValue(dates.dating),
              showsChevron: true,
              onTap: () => cubit.selectKind('dating', currentDate: dates.dating.date),
            ),
            BaseListTile(
              title: l10n.storyEngaged,
              subtitle: subtitleFor(dates.engaged),
              value: formatValue(dates.engaged),
              showsChevron: true,
              onTap: () => cubit.selectKind('engaged', currentDate: dates.engaged.date),
            ),
            BaseListTile(
              title: l10n.storyMarried,
              subtitle: subtitleFor(dates.married),
              value: formatValue(dates.married),
              showsChevron: true,
              onTap: () => cubit.selectKind('married', currentDate: dates.married.date),
            ),
          ],
        ),
        if (state.selectedKind != null) ...[
          const SizedBox(height: AppSpace.s18),
          BaseSurfaceCard(
            title: titleForKind(state.selectedKind!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseDateField(
                  value: state.draftDate ?? clock.now(),
                  label: l10n.dateRowLabel,
                  formatter: (date) => HistoryDateFormatter.formatMilestoneDate(
                    l10n,
                    date: date,
                    precision: MilestoneDatePrecision.month,
                  ),
                  onChanged: cubit.onDraftDateChanged,
                ),
                const SizedBox(height: AppSpace.s12),
                BaseButton(
                  text: l10n.saveMilestone,
                  isLoading: state.saveAction.isLoading,
                  onPressed: () => cubit.saveSelectedDate(title: titleForKind(state.selectedKind!)),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: AppSpace.s16),
        BaseNote(icon: AppIcons.calendar, text: l10n.storyDatesNote),
      ],
    );
  }
}
