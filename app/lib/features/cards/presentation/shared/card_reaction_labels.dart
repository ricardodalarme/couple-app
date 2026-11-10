import 'package:flutter_bloc_starter/features/cards/data/models/card_reaction.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

extension CardReactionLabels on Translations$cardsList$pt {
  String labelFor(CardReaction reaction) => switch (reaction) {
    CardReaction.thankYou => reactionThankYou,
    CardReaction.hug => reactionHug,
    CardReaction.madeMyDay => reactionMadeMyDay,
    CardReaction.noted => reactionNoted,
  };

  String? reactionLabelOf(String? value) {
    final reaction = CardReaction.fromValue(value);

    return reaction == null ? null : labelFor(reaction);
  }
}
