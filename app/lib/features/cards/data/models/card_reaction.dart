/// The four fixed reactions a recipient can send with a card.
enum CardReaction(final String value) {
  thankYou('thank_you'),
  hug('hug'),
  madeMyDay('made_my_day'),
  noted('noted');

  static CardReaction? fromValue(String? value) {
    for (final reaction in values) {
      if (reaction.value == value) return reaction;
    }
    return null;
  }
}
