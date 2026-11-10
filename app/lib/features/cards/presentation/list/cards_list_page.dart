import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/list/cubit/cards_list_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/list/widgets/card_summary_tile.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// How close to the end of the list, in pixels, the next page starts loading.
const double _loadMoreThreshold = 400;

@RoutePage()
class const CardsListPage({super.key}) extends StatefulWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CardsListCubit>()..load(),
      child: this,
    );
  }

  @override
  State<CardsListPage> createState() => _CardsListPageState();
}

class _CardsListPageState() extends State<CardsListPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.extentAfter < _loadMoreThreshold) {
        context.read<CardsListCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardsList;
    final cards = context.select((CardsListCubit cubit) => cubit.state.cards);
    final isLoadingMore = context.select((CardsListCubit cubit) => cubit.state.isLoadingMore);
    final cubit = context.read<CardsListCubit>();

    return BaseView(
      appBar: BaseAppBar(title: l10n.title),
      body: SkeletonizerResourceWidget<List<CardSummary>>(
        cards,
        fakeValue: [CardSummary.fake(), CardSummary.fake()],
        successBuilder: (items) => BaseListView(
          itemCount: items.isEmpty ? 0 : 1 + (isLoadingMore ? 1 : 0),
          controller: _controller,
          onRefresh: cubit.load,
          padding: const EdgeInsets.fromLTRB(
            AppSpace.screenMargin,
            AppSpace.s8,
            AppSpace.screenMargin,
            AppSpace.s34,
          ),
          emptyBuilder: (_) => BaseEmptyState(title: l10n.emptyTitle, text: l10n.emptyText),
          itemBuilder: (context, index) => index == 0
              ? BaseListGroup(children: [for (final card in items) CardSummaryTile(card: card)])
              : const Padding(
                  padding: EdgeInsets.only(top: AppSpace.s16),
                  child: Center(child: BaseLoadingDots()),
                ),
        ),
        failureBuilder: (failure) => BaseEmptyState(
          face: FaceKind.sad,
          title: l10n.errorTitle,
          text: l10n.errors.selectOrFallback(failure.l10nKey),
          actionText: context.l10n.common.retry,
          onAction: cubit.load,
        ),
      ),
    );
  }
}
