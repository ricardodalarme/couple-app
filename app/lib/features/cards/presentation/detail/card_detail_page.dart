import 'package:auto_route/auto_route.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/widgets/card_reaction_section.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/widgets/card_response_received.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/card_view.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

@RoutePage()
class const CardDetailPage({@PathParam('id') required final String cardId, super.key})
    extends StatelessWidget
    implements AutoRouteWrapper {
  static final CardDetail _skeleton = CardDetail.fake();

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
    final card = context.select((CardDetailCubit cubit) => cubit.state.card);

    return BaseView(
      appBar: BaseAppBar(title: l10n.detailTitle),
      body: BlocListener<CardDetailCubit, CardDetailState>(
        listenWhen: (previous, current) =>
            previous.reactionAction != current.reactionAction && current.reactionAction is Failure,
        listener: (context, _) => BaseToast.show(context, l10n.reactionError),
        child: SkeletonizerResourceWidget<CardDetail>(
          card,
          fakeValue: _skeleton,
          successBuilder: (detail) => _DetailBody(detail: detail),
          failureBuilder: (failure) {
            final isMissing = failure.l10nKey == 'CARD_NOT_FOUND';

            return BaseEmptyState(
              face: FaceKind.sad,
              title: l10n.detailErrorTitle,
              text: isMissing ? l10n.notFound : l10n.errors.selectOrFallback(failure.l10nKey),
              actionText: isMissing ? null : context.l10n.common.retry,
              onAction: isMissing ? null : () => context.read<CardDetailCubit>().load(cardId),
            );
          },
        ),
      ),
    );
  }
}

class const _DetailBody({required final CardDetail detail}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final showsResponse =
        detail.isMine && (detail.reaction != null || (detail.reply ?? '').isNotEmpty);

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardView(card: detail.card, fromName: detail.authorName, toName: detail.recipientName),
          if (showsResponse) ...[
            const SizedBox(height: AppSpace.s24),
            CardResponseReceived(detail: detail),
          ],
          if (!detail.isMine) ...[
            const SizedBox(height: AppSpace.s24),
            const CardReactionSection(),
          ],
        ],
      ),
    );
  }
}
