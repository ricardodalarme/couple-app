import 'package:flutter_bloc_starter/features/reminders/data/data_sources/reminders_local_data_source.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/planner/reminder_planner.dart';
import 'package:local_notification_service/local_notification_service.dart';
import 'package:logger/logger.dart';

/// How many days ahead reminders are planned.
const int reminderHorizonDays = 14;

/// The hour of day the daily idea and the weekly card are offered.
const int reminderHour = 18;

/// The fixed texts for each reminder, so no reminder ever carries personal content.
typedef ReminderTexts = ({
  String title,
  String dailyIdea,
  String dates,
  String weeklyCard,
  String discreet,
});

class RemindersRepository({
  required final RemindersLocalDataSource _localDataSource,
  required final LocalNotificationService _notificationService,
}) {
  final Logger _logger = Logger('RemindersRepository');

  ReminderPreferences getPreferences() => _localDataSource.read();

  Future<void> savePreferences(ReminderPreferences preferences) =>
      _localDataSource.write(preferences);

  /// Plans the next reminders and replaces the pending ones on the device.
  ///
  /// [dateReminders] are moments for important dates, supplied by the caller. Everything
  /// works offline.
  Future<List<PlannedReminder>> reschedule({
    required ReminderTexts texts,
    required DateTime now,
    Iterable<ReminderCandidate> dateReminders = const [],
  }) async {
    final planner = ReminderPlanner(
      texts: {
        ReminderKind.dailyIdea: texts.dailyIdea,
        ReminderKind.dates: texts.dates,
        ReminderKind.weeklyCard: texts.weeklyCard,
      },
      discreetText: texts.discreet,
    );
    final plan = planner.plan(
      preferences: getPreferences(),
      candidates: [...candidatesFor(now), ...dateReminders],
      now: now,
    );
    try {
      await _notificationService.replaceAll([
        for (final reminder in plan)
          LocalNotificationRequest(
            id: reminder.id,
            at: reminder.at,
            title: texts.title,
            body: reminder.text,
          ),
      ]);
    } catch (e, stack) {
      _logger.warning('Could not schedule reminders', error: e, stackTrace: stack);
      rethrow;
    }

    return plan;
  }

  /// Removes every pending reminder, for example when notifications are turned off.
  Future<void> cancelAll() => _notificationService.cancelAll();

  /// The daily idea every evening and the weekly card on Sunday evenings.
  static List<ReminderCandidate> candidatesFor(DateTime now) {
    final candidates = <ReminderCandidate>[];
    for (var offset = 0; offset < reminderHorizonDays; offset++) {
      final day = DateTime(now.year, now.month, now.day + offset, reminderHour);
      candidates.add(ReminderCandidate(kind: ReminderKind.dailyIdea, at: day));
      if (day.weekday == DateTime.sunday) {
        candidates.add(ReminderCandidate(kind: ReminderKind.weeklyCard, at: day));
      }
    }

    return candidates;
  }
}
