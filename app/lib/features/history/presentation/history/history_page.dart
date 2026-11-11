import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_hero_section.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_stats_row.dart';
import 'package:flutter_bloc_starter/features/history/presentation/history/widgets/history_timeline_section.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// "Nossa história" (X-140) — tall scrollable overview with hero counter,
/// descriptive numbers summary, and year-paginated timeline of milestones & memories.
@RoutePage()
class const HistoryPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HistoryCubit>()..load(),
      child: this,
    );
  }

  Future<void> _pushAndReload(BuildContext context, PageRouteInfo route) async {
    final cubit = context.read<HistoryCubit>();
    await context.pushRoute(route);
    await cubit.load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final overviewResource = context.select((HistoryCubit cubit) => cubit.state.overview);
    final cubit = context.read<HistoryCubit>();

    return BaseView(
      appBar: BaseAppBar(
        title: l10n.title,
        trailing: BaseRoundButton(
          icon: AppIcons.plus,
          semanticLabel: l10n.addMilestoneTooltip,
          onPressed: () => _pushAndReload(context, MilestoneRoute()),
        ),
      ),
      body: BaseRefreshable(
        onRefresh: cubit.load,
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<HistoryOverview>(
            overviewResource,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HistoryHeroSection(
                  overview: overview,
                  onAvatarTap: () => _pushAndReload(context, const HistoryAvatarRoute()),
                  onDatesTap: () => _pushAndReload(context, const StoryDatesRoute()),
                  onDifferentDatesTap: () => _pushAndReload(context, const DifferentDatesRoute()),
                ),
                const SizedBox(height: AppSpace.s24),
                HistoryStatsRow(
                  numbers: overview.numbers,
                  onNumbersTap: () => _pushAndReload(context, const HistoryNumbersRoute()),
                  onStoryDatesTap: () => _pushAndReload(context, const StoryDatesRoute()),
                  onVariationsTap: () => _pushAndReload(context, const CounterVariationsRoute()),
                  onAvatarTap: () => _pushAndReload(context, const HistoryAvatarRoute()),
                ),
                const SizedBox(height: AppSpace.s24),
                HistoryTimelineSection(
                  overview: overview,
                  onMilestoneTap: (milestone) =>
                      _pushAndReload(context, MilestoneRoute(initialMilestone: milestone)),
                  onAddMilestoneTap: () => _pushAndReload(context, MilestoneRoute()),
                  onSuggestedFirstTap: () => _pushAndReload(
                    context,
                    MilestoneRoute(
                      initialTitle: l10n.suggestedFirstTitle,
                      initialKind: MilestoneKind.met,
                    ),
                  ),
                ),
              ],
            ),
            failureBuilder: (_) => BaseEmptyState(
              title: l10n.errorTitle,
              text: l10n.errorText,
              actionText: context.l10n.common.retry,
              onAction: cubit.load,
            ),
          ),
        ),
      ),
    );
  }
}
