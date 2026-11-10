/// The needs a person can attach to the mood, matching the server values.
enum NeedKind(final String value) {
  listen('listen'),
  opinion('opinion'),
  hug('hug'),
  space('space');

  static NeedKind? fromValue(String? value) {
    for (final need in values) {
      if (need.value == value) return need;
    }
    return null;
  }
}
