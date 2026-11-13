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
              onTap: () =>
                  _pickDate(context, kind: 'met', title: l10n.storyMet, date: dates.met.date),
            ),
            BaseListTile(
              title: l10n.storyDating,
              subtitle: subtitleFor(dates.dating),
              value: formatValue(dates.dating),
              showsChevron: true,
              onTap: () => _pickDate(
                context,
                kind: 'dating',
                title: l10n.storyDating,
                date: dates.dating.date,
              ),
            ),
            BaseListTile(
              title: l10n.storyEngaged,
              subtitle: subtitleFor(dates.engaged),
              value: formatValue(dates.engaged),
              showsChevron: true,
              onTap: () => _pickDate(
                context,
                kind: 'engaged',
                title: l10n.storyEngaged,
                date: dates.engaged.date,
              ),
            ),
            BaseListTile(
              title: l10n.storyMarried,
              subtitle: subtitleFor(dates.married),
              value: formatValue(dates.married),
              showsChevron: true,
              onTap: () => _pickDate(
                context,
                kind: 'married',
                title: l10n.storyMarried,
                date: dates.married.date,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpace.s16),
        BaseNote(icon: AppIcons.calendar, text: l10n.storyDatesNote),
      ],
    );
  }

  Future<void> _pickDate(
    BuildContext context, {
    required String kind,
    required String title,
    DateTime? date,
  }) async {
    final cubit = context.read<StoryDatesCubit>();
    final picked = await BaseDateField.showPicker(context, title: title, initial: date);
    if (picked == null || !context.mounted) return;

    await cubit.saveDate(kind: kind, title: title, date: picked);
  }
}
