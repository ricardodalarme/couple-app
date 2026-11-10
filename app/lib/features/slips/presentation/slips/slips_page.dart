import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/cubit/slips_list_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/widgets/slips_groups.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/router/app_router.dart';

/// How close to the end of the list, in pixels, the next page starts loading.
const double _loadMoreThreshold = 400;

@RoutePage()
class const SlipsPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<SlipsListCubit>()..start(),
      child: this,
    );
  }

  @override
  State<SlipsPage> createState() => _SlipsPageState();
}

class _SlipsPageState() extends State<SlipsPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final position = _controller.position;
    if (position.extentAfter < _loadMoreThreshold) context.read<SlipsListCubit>().loadMore();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipsList;
    final slips = context.select((SlipsListCubit cubit) => cubit.state.slips);
    final scope = context.select((SlipsListCubit cubit) => cubit.state.scope);
    final cubit = context.read<SlipsListCubit>();

    return BaseView(
      appBar: null,
      body: BaseRefreshable(
        onRefresh: cubit.load,
        child: BaseStackedContent(
          controller: _controller,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.title, style: context.text.titleXl),
              const SizedBox(height: AppSpace.s16),
              BaseSegmented(
                segments: [l10n.scopeWeek, l10n.scopeAll],
                selectedIndex: scope.index,
                onSelectionChanged: (index) => cubit.changeScope(SlipsScope.values[index]),
              ),
              const SizedBox(height: AppSpace.s16),
              BaseSectionHeader(title: l10n.private, isLabel: true, showsLock: true),
              const SizedBox(height: AppSpace.s10),
              SkeletonizerResourceWidget<List<SlipEntry>>(
                slips,
                fakeValue: [SlipEntry.fake(), SlipEntry.fake(), SlipEntry.fake()],
                successBuilder: (items) => items.isEmpty
                    ? BaseEmptyState(
                        title: l10n.emptyTitle,
                        text: l10n.emptyText,
                        actionText: l10n.emptyAction,
                        onAction: () => context.router.root.push(const QuickSlipRoute()),
                      )
                    : SlipsGroups(slips: items),
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
      ),
    );
  }
}
