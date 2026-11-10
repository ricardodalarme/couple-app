import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/card_view.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const CardDetailPage({@PathParam('id') required final String cardId, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInjector.instance.get<CardDetailCubit>()..load(cardId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardsList;
    final detail = context.watch<CardDetailCubit>().state;

    return BaseView(
      appBar: BaseAppBar(title: l10n.detailTitle),
      body: switch (detail) {
        Success<CardDetail>(:final value) => BaseStackedContent(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardView(card: value.card, fromName: value.authorName, toName: value.recipientName),
              if (value.reaction != null || value.reply != null) ...[
                const SizedBox(height: AppSpace.s16),
                BaseSectionHeader(title: l10n.reactionLabel),
                const SizedBox(height: AppSpace.s8),
                BaseSurfaceCard(
                  child: Text(
                    [value.reaction, value.reply].whereType<String>().join('\n'),
                    style: context.text.bodyLg,
                  ),
                ),
              ],
            ],
          ),
        ),
        Failure() => BaseEmptyState(
          title: l10n.errorTitle,
          text: l10n.notFound,
          actionText: context.l10n.common.retry,
          onAction: () => context.read<CardDetailCubit>().load(cardId),
        ),
        _ => const Center(child: BaseLoadingDots()),
      },
    );
  }
}
