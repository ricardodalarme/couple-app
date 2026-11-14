import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/ritual_schedule.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/together/data/models/ritual.dart';

/// Keeps the local ritual reminders in line with the rituals that have one switched on.
class RitualReminderService({
  required final RemindersRepository _remindersRepository,
  required final ReminderSyncService _syncService,
}) {
  /// Replaces the stored schedules with the ones in [rituals] and plans the reminders again.
  Future<void> update(List<Ritual> rituals) async {
    await _remindersRepository.saveRitualSchedules([
      for (final ritual in rituals)
        if (ritual.hasReminder)
          RitualSchedule(
            id: ritual.id,
            cadence: ritual.cadence.name,
            weekday: ritual.needsWeekday ? ritual.weekday : null,
            time: TimeOfDayValue(hour: ritual.hour, minute: 0),
          ),
    ]);
    await _syncService.sync();
  }
}
