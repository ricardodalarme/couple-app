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
    final isSearching = context.select((SlipsListCubit cubit) => cubit.state.isSearching);
    final query = context.select((SlipsListCubit cubit) => cubit.state.query);
    final cubit = context.read<SlipsListCubit>();
    final isEmpty = slips is Success<List<SlipEntry>> && slips.value.isEmpty;

    return BaseView(
      appBar: null,
      body: BaseRefreshable(
        onRefresh: cubit.load,
        child: BaseStackedContent(
          controller: _controller,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(child: Text(l10n.title, style: context.text.titleXl)),
                  if (!isEmpty)
                    BaseRoundButton(
                      icon: isSearching ? AppIcons.close : AppIcons.search,
                      semanticLabel: isSearching ? l10n.searchClose : l10n.search,
                      onPressed: isSearching ? cubit.closeSearch : cubit.openSearch,
                    ),
                ],
              ),
              const SizedBox(height: AppSpace.s16),
              if (!isEmpty) ...[
                if (isSearching) ...[
                  BaseTextField(
                    text: query,
                    hint: l10n.searchHint,
                    onChanged: cubit.onQueryChanged,
                  ),
                  const SizedBox(height: AppSpace.s16),
                ],
                Wrap(
                  spacing: AppSpace.s8,
                  runSpacing: AppSpace.s8,
                  children: [
                    for (final option in SlipsScope.values)
                      BaseChoiceChip(
                        label: option == SlipsScope.week ? l10n.scopeWeek : l10n.scopeAll,
                        isSelected: scope == option,
                        onTap: () => cubit.changeScope(option),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpace.s16),
              ],
              SkeletonizerResourceWidget<List<SlipEntry>>(
                slips,
                fakeValue: [SlipEntry.fake(), SlipEntry.fake(), SlipEntry.fake()],
                successBuilder: (items) => items.isEmpty
                    ? BaseEmptyState(
                        title: l10n.emptyTitle,
                        text: l10n.emptyText,
                        face: FaceKind.thinking,
                        actionText: l10n.emptyAction,
                        onAction: () => context.router.root.push(const QuickSlipRoute()),
                      )
                    : _Results(items: items),
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

class const _Results({required final List<SlipEntry> items}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.slipsList;
    final matches = context.select((SlipsListCubit cubit) => cubit.state.matching(items));
    if (matches.isEmpty) {
      return BaseEmptyState(title: l10n.searchEmptyTitle, text: l10n.searchEmptyText);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlipsGroups(slips: matches),
        const SizedBox(height: AppSpace.s16),
        Align(
          alignment: Alignment.centerLeft,
          child: BaseTextLink(
            text: l10n.pastCards,
            onPressed: () => context.pushRoute(const CardsListRoute()),
          ),
        ),
      ],
    );
  }
}
