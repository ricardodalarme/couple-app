/// Stable keys for how a person tends to react in a fight.
const List<String> reactionPatternKeys = ['pursue', 'withdraw', 'repair', 'avoid'];

/// The six questions of the exercise.
const int fightStyleQuestionCount = 6;

/// Counts each chosen pattern; unknown answers are ignored.
Map<String, int> scoreReactions(Iterable<String> answers) {
  final scores = {for (final key in reactionPatternKeys) key: 0};
  for (final answer in answers) {
    final current = scores[answer];
    if (current != null) scores[answer] = current + 1;
  }

  return scores;
}

/// Orders the patterns by score, keeping the canonical order on a tie.
List<String> rankReactions(Iterable<String> answers) {
  final scores = scoreReactions(answers);

  return [...reactionPatternKeys]..sort((a, b) {
    final byScore = scores[b]!.compareTo(scores[a]!);

    return byScore != 0
        ? byScore
        : reactionPatternKeys.indexOf(a).compareTo(reactionPatternKeys.indexOf(b));
  });
}

/// The display order of the options, rotated per question so no pattern always comes first.
List<String> reactionOrderFor(int questionIndex) {
  final offset = questionIndex % reactionPatternKeys.length;

  return [...reactionPatternKeys.sublist(offset), ...reactionPatternKeys.sublist(0, offset)];
}
