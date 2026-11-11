/// The relationship phases the server accepts, in the order the screen lists them.
enum RelationshipPhase(final String serverValue) {
  beginning('beginning'),
  dating('dating'),
  livingTogether('living_together'),
  engaged('engaged'),
  married('married'),
  withKids('with_kids'),
  longDistance('long_distance'),
  withParents('with_parents'),
  restarting('restarting');

  /// Maps a stored server value, including values this build does not know.
  static RelationshipPhase? fromServer(String? value) {
    if (value == null) return null;
    for (final phase in values) {
      if (phase.serverValue == value) return phase;
    }
    return null;
  }
}
