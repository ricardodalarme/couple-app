/// How a game collects and shows its answers.
enum GameFlow() {
  /// Each person picks who fits a phrase better.
  pick,

  /// Each person answers about themselves, then guesses the partner's answer.
  guess,

  /// Each person answers an open question in private.
  talk,

  /// A prompted date followed by a short reflection.
  date,
}

/// A game the couple can play, matching a `game_sessions.game` key.
enum GameKind(
  final String key,
  final GameFlow flow,
  final int itemCount,
  final int minutes, {
  final String? contentKind,
}) {
  meOrYou('me_or_you', GameFlow.pick, 5, 3, contentKind: 'me_or_you'),
  howWell('how_well', GameFlow.guess, 10, 5, contentKind: 'how_well'),
  twentyQuestions('twenty_questions', GameFlow.talk, 20, 5),
  neverHaveWe('never_have_we', GameFlow.talk, 10, 10, contentKind: 'never_have_we'),
  mission('mission', GameFlow.date, 1, 20, contentKind: 'mission');

  /// The game for a server [key], or null when the app has no screens for it.
  static GameKind? fromKey(String key) {
    for (final kind in values) {
      if (kind.key == key) return kind;
    }

    return null;
  }

  /// Whether every question is asked twice, once about the person and once as a guess.
  bool get asksTwice => flow == GameFlow.guess;

  /// Whether the app has a content kind it can read for this game.
  bool get hasContent => contentKind != null;
}
