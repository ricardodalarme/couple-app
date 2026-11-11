import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/history/presentation/numbers/cubit/history_numbers_cubit.dart';
import 'package:flutter_bloc_starter/features/history/presentation/numbers/widgets/history_numbers_grid.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// "Nossa história em números" (X-157) — purely descriptive counts of days together,
/// weekends, full moons, Christmases, places, and next anniversary.
@RoutePage()
class const HistoryNumbersPage({super.key}) extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<HistoryNumbersCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.history;
    final overviewResource = context.select((HistoryNumbersCubit cubit) => cubit.state.overview);
    final cubit = context.read<HistoryNumbersCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.numbersTitle),
      body: BaseRefreshable(
        onRefresh: cubit.load,
        child: BaseStackedContent(
          body: SkeletonizerResourceWidget<HistoryOverview>(
            overviewResource,
            fakeValue: HistoryOverview.fake(),
            successBuilder: (overview) => HistoryNumbersGrid(overview: overview),
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
