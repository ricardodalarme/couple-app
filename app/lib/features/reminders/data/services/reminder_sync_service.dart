import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/repositories/reminders_repository.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:logger/logger.dart';

/// Keeps the pending local reminders in line with what the person allowed and chose.
///
/// Run at sign-in, when the app returns to the foreground and after a preference changes, so a
/// reboot, an update or a time zone change never leaves stale reminders.
class ReminderSyncService({
  required final NotificationsRepository _notificationsRepository,
  required final RemindersRepository _remindersRepository,
}) {
  final Logger _logger = Logger('ReminderSyncService');

  Future<void> sync({DateTime? now}) async {
    try {
      final access = await _notificationsRepository.currentAccess();
      if (access == NotificationAccess.denied) {
        await _remindersRepository.cancelAll();
        return;
      }

      final texts = l10n.reminders;
      await _remindersRepository.reschedule(
        now: now ?? DateTime.now(),
        texts: (
          title: texts.title,
          dailyIdea: texts.dailyIdea,
          dates: texts.dates,
          weeklyCard: texts.weeklyCard,
          discreet: texts.discreet,
        ),
      );
    } on Object catch (error, stackTrace) {
      _logger.warning('Reminder sync failed', error: error, stackTrace: stackTrace);
    }
  }
}
