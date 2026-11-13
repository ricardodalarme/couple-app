import 'package:preferences_service/preferences_service.dart';

/// Keeps the week the person dismissed the check-in for.
class CheckinLocalDataSource({required final PreferencesService _preferencesService}) {
  static const dismissedWeekKey = 'checkinDismissedWeek';

  DateTime? readDismissedWeek() {
    final raw = _preferencesService.readString(key: dismissedWeekKey);
    if (raw == null) return null;

    return DateTime.tryParse(raw);
  }

  bool isDismissedFor(DateTime weekStart) {
    final dismissed = readDismissedWeek();

    return dismissed != null && _sameDay(dismissed, weekStart);
  }

  Future<void> writeDismissedWeek(DateTime weekStart) => _preferencesService.writeString(
    key: dismissedWeekKey,
    value: weekStart.toIso8601String().substring(0, 10),
  );

  bool _sameDay(DateTime first, DateTime second) =>
      first.year == second.year && first.month == second.month && first.day == second.day;
}
