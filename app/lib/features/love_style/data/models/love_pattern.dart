/// Stable keys for the ways a person feels loved.
const List<String> lovePatternKeys = ['time', 'words', 'acts', 'gifts', 'touch'];

/// The six questions of the exercise.
const int loveStyleQuestionCount = 6;

/// Counts each chosen pattern; unknown answers are ignored.
Map<String, int> scoreLovePatterns(Iterable<String> answers) {
  final scores = {for (final key in lovePatternKeys) key: 0};
  for (final answer in answers) {
    final current = scores[answer];
    if (current != null) scores[answer] = current + 1;
  }

  return scores;
}

/// Orders the patterns by score, keeping the canonical order on a tie.
List<String> rankLovePatterns(Iterable<String> answers) {
  final scores = scoreLovePatterns(answers);

  return [...lovePatternKeys]..sort((a, b) {
    final byScore = scores[b]!.compareTo(scores[a]!);

    return byScore != 0
        ? byScore
        : lovePatternKeys.indexOf(a).compareTo(lovePatternKeys.indexOf(b));
  });
}

/// The display order of the options, rotated per question so no pattern always comes first.
List<String> lovePatternOrderFor(int questionIndex) {
  final offset = questionIndex % lovePatternKeys.length;

  return [...lovePatternKeys.sublist(offset), ...lovePatternKeys.sublist(0, offset)];
}
