import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/together/presentation/day/cubit/day_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// What matters on a chosen day, with a way to step through the days.
@RoutePage()
class const DayPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => AppInjector.instance.get<DayCubit>()..load(), child: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.day;
    final state = context.select((DayCubit cubit) => cubit.state);
    final cubit = context.read<DayCubit>();

    return BaseView(
      body: BaseStackedContent(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              header: true,
              child: Text(
                l10n.dateLine(
                  day: state.day.day,
                  month: l10n.months[state.day.month - 1],
                  year: state.day.year,
                ),
                style: context.text.titleXl,
              ),
            ),
            const SizedBox(height: AppSpace.s12),
            Row(
              children: [
                Expanded(
                  child: BaseButton(
                    text: l10n.previous,
                    variant: .secondary,
                    onPressed: () => cubit.move(-1),
                  ),
                ),
                const SizedBox(width: AppSpace.s10),
                Expanded(
                  child: BaseButton(
                    text: l10n.next,
                    variant: .secondary,
                    onPressed: () => cubit.move(1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpace.s20),
            SkeletonizerResourceWidget<DayContent>(
              state.content,
              fakeValue: (dates: const [], plans: const []),
              successBuilder: (content) {
                if (content.dates.isEmpty && content.plans.isEmpty) {
                  return BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText);
                }

                return BaseListGroup(
                  children: [
                    for (final date in content.dates) BaseListTile(title: date.title),
                    for (final plan in content.plans)
                      BaseListTile(title: plan.title, subtitle: l10n.planned),
                  ],
                );
              },
              failureBuilder: (_) => BaseEmptyState(
                title: l10n.errorTitle,
                text: l10n.errorText,
                actionText: context.l10n.common.retry,
                onAction: cubit.load,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
