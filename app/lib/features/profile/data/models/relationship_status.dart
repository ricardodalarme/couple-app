/// The relationship states the server accepts.
enum RelationshipStatus(final String serverValue) {
  together('together'),
  onBreak('on_break'),
  ended('ended'),
  bereaved('bereaved');

  /// Maps a stored server value, falling back to [together] for unknown values.
  static RelationshipStatus fromServer(String? value) {
    for (final status in values) {
      if (status.serverValue == value) return status;
    }
    return together;
  }
}
