import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/cubit/slips_list_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// Slips grouped by week, newest week first.
class const SlipsGroups({required final List<SlipEntry> slips, super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoadingMore = context.select((SlipsListCubit cubit) => cubit.state.isLoadingMore);
    final groups = groupByWeek(slips);
    final thisMonday = _monday(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final group in groups.entries) ...[
          BaseSectionHeader(title: _weekTitle(context, group.key, thisMonday)),
          const SizedBox(height: AppSpace.s8),
          BaseListGroup(
            children: [
              for (final slip in group.value)
                BaseListTile(
                  title: slip.body,
                  subtitle: _dayLine(context, slip),
                  onTap: () => context.pushRoute(SlipDetailRoute(id: slip.id)),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s20),
        ],
        if (isLoadingMore) const Center(child: BaseLoadingDots()),
      ],
    );
  }

  String _weekTitle(BuildContext context, DateTime monday, DateTime thisMonday) {
    final l10n = context.l10n.slipsList;
    if (monday == thisMonday) return l10n.thisWeek;
    if (monday == thisMonday.subtract(const Duration(days: 7))) return l10n.lastWeek;

    final end = monday.add(const Duration(days: 6));
    String short(DateTime date) =>
        l10n.dateShort(day: date.day, month: l10n.monthsShort[date.month - 1]);

    return l10n.weekRange(start: short(monday), end: short(end));
  }

  String _dayLine(BuildContext context, SlipEntry slip) {
    final l10n = context.l10n.slipsList;
    final day = l10n.weekdaysShort[slip.createdAt.toLocal().weekday - 1];
    final category = slip.category;
    if (category == null) return day;

    return l10n.dayLine(weekday: day, category: l10n.categories.selectOrFallback(category));
  }
}

/// Groups [slips] by the Monday of the week they were written, keeping the input order.
Map<DateTime, List<SlipEntry>> groupByWeek(List<SlipEntry> slips) {
  final groups = <DateTime, List<SlipEntry>>{};
  for (final slip in slips) {
    groups.putIfAbsent(_monday(slip.createdAt.toLocal()), () => []).add(slip);
  }

  return groups;
}

DateTime _monday(DateTime date) {
  final day = DateTime(date.year, date.month, date.day);

  return day.subtract(Duration(days: day.weekday - DateTime.monday));
}
