import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';

/// The most pending notifications iOS keeps for an app.
const int platformPendingLimit = 64;

/// Decides which local reminders to schedule. Pure: no clock, no platform.
///
/// The rules, in order: paused or disabled kinds are dropped; at most `maxPerDay` remain per
/// calendar day, keeping the earliest; the nearest [platformPendingLimit] are kept. Texts come
/// from the fixed lists passed in, never from user content.
class const ReminderPlanner({
  required final Map<ReminderKind, String> texts,
  required final String discreetText,
}) {
  List<PlannedReminder> plan({
    required ReminderPreferences preferences,
    required Iterable<ReminderCandidate> candidates,
    required DateTime now,
  }) {
    if (preferences.isPaused) return const [];

    final moved = <ReminderCandidate>[];
    for (final candidate in candidates) {
      if (candidate.kind != ReminderKind.followUp &&
          !preferences.enabled.contains(candidate.kind)) {
        continue;
      }

      final at = candidate.at;
      if (!at.isAfter(now)) continue;
      moved.add(ReminderCandidate(kind: candidate.kind, at: at, key: candidate.key));
    }
    moved.sort((a, b) => a.at.compareTo(b.at));

    final perDay = <String, int>{};
    final kept = <ReminderCandidate>[];
    for (final candidate in moved) {
      final day = '${candidate.at.year}-${candidate.at.month}-${candidate.at.day}';
      final count = perDay[day] ?? 0;
      if (count >= preferences.maxPerDay) continue;
      perDay[day] = count + 1;
      kept.add(candidate);
    }

    return [
      for (final candidate in kept.take(platformPendingLimit))
        PlannedReminder(
          id: idFor(candidate),
          kind: candidate.kind,
          at: candidate.at,
          text: preferences.isDiscreet ? discreetText : texts[candidate.kind] ?? discreetText,
        ),
    ];
  }

  /// A stable id, so planning again replaces the same notification instead of duplicating it.
  static int idFor(ReminderCandidate candidate) {
    final seed = '${candidate.kind.name}|${candidate.key ?? ''}|${candidate.at.toIso8601String()}';
    var hash = 0;
    for (final unit in seed.codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }

    return hash;
  }
}
