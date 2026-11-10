import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/card_reaction_labels.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

/// The sender's quiet view of the answer the partner gave.
class const CardResponseReceived({required final CardDetail detail, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.cardsList;
    final reaction = context.select((CardDetailCubit cubit) => cubit.state.reaction);
    final label = l10n.reactionLabelOf(reaction);
    final reply = detail.reply;
    final name = detail.recipientName;

    if (label == null && (reply == null || reply.isEmpty)) return const SizedBox.shrink();

    final quote = reaction == CardReaction.madeMyDay.value ? l10n.reactionQuoteMadeMyDay : label;

    return BaseSurfaceCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseFace(kind: FaceKind.affectionate, size: FaceSize.reaction),
          const SizedBox(width: AppSpace.s14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (name == null)
                  Text(l10n.responseReceivedNoName, style: context.text.titleSm)
                else
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '${l10n.responseReceivedName(name: name)} '),
                        TextSpan(
                          text: l10n.responseReceivedVerb,
                          style: TextStyle(color: context.colors.accentHighlight),
                        ),
                      ],
                    ),
                    style: context.text.titleSm,
                  ),
                if (quote != null) ...[
                  const SizedBox(height: AppSpace.s10),
                  Text(l10n.responseQuote(label: quote), style: context.text.hand),
                ],
                if (reply != null && reply.isNotEmpty) ...[
                  const SizedBox(height: AppSpace.s8),
                  Text(reply, style: context.text.body),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
