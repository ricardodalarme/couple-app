/// How long a pause lasts, from the person's point of view.
enum PauseReturn(
  /// How long after the pause starts the person is back.
  final Duration length,
) {
  oneHour(Duration(hours: 1)),
  threeHours(Duration(hours: 3)),
  eightHours(Duration(hours: 8)),

  /// Kept under the 24 hours the server allows.
  tomorrow(Duration(hours: 23));

  /// The moment the pause ends when it starts at [now].
  DateTime returnAt(DateTime now) => now.add(length);
}

/// The longest pause message the server accepts.
const int pauseMessageMaxLength = 200;

/// The ready-made pause messages.
const List<String> pausePresets = ['space', 'later', 'calm'];
