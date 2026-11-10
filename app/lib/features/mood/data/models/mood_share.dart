/// Who sees the mood, matching the server values. Private by default.
enum MoodShare(final String value) {
  mood('mood'),
  moodNeed('mood_need'),
  none('none');

  static MoodShare fromValue(String? value) {
    for (final share in values) {
      if (share.value == value) return share;
    }
    return none;
  }
}
