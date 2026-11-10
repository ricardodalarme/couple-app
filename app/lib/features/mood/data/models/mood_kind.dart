/// The six moods a person can pick, matching the server values.
enum MoodKind(final String value) {
  happy('happy'),
  tired('tired'),
  sad('sad'),
  stressed('stressed'),
  loving('loving'),
  playful('playful');

  static MoodKind? fromValue(String? value) {
    for (final mood in values) {
      if (mood.value == value) return mood;
    }
    return null;
  }
}
