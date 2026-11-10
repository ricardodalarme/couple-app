import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/ritual_schedule.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const evening = TimeOfDayValue(hour: 19, minute: 30);
  // A Tuesday.
  final now = DateTime(2026, 11, 10, 12);

  test('a daily ritual reminds every day of the window', () {
    const schedule = RitualSchedule(id: 'r', cadence: 'daily', time: evening);

    final result = schedule.candidates(now, days: 14);

    expect(result, hasLength(14));
    expect(result.first.at, DateTime(2026, 11, 10, 19, 30));
  });

  test('a weekly ritual reminds on its weekday only', () {
    // Friday is 5 counting from Sunday as 0.
    const schedule = RitualSchedule(id: 'r', cadence: 'weekly', weekday: 5, time: evening);

    final result = schedule.candidates(now, days: 14);

    expect(result, hasLength(2));
    expect(result.every((c) => c.at.weekday == DateTime.friday), isTrue);
  });

  test('a biweekly ritual skips every other week', () {
    const schedule = RitualSchedule(id: 'r', cadence: 'biweekly', weekday: 5, time: evening);

    final result = schedule.candidates(now, days: 21);

    expect(result, hasLength(2));
    expect(result[1].at.difference(result[0].at).inDays, 14);
  });

  test('a monthly ritual falls in the first week of the month', () {
    const schedule = RitualSchedule(id: 'r', cadence: 'monthly', weekday: 0, time: evening);

    final result = schedule.candidates(DateTime(2026, 11, 1), days: 40);

    expect(result.every((c) => c.at.day <= 7 && c.at.weekday == DateTime.sunday), isTrue);
    expect(result, isNotEmpty);
  });

  test('a schedule survives the storage round trip', () {
    const schedule = RitualSchedule(id: 'r', cadence: 'weekly', weekday: 0, time: evening);

    expect(RitualSchedule.fromMap(schedule.toMap()), schedule);
  });
}
