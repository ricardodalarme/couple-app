import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/planned_reminder.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';

/// When a ritual repeats and at what time its reminder goes off.
///
/// [weekday] counts from Sunday as 0; a daily ritual has none.
final class const RitualSchedule({
  required final String id,
  required final String cadence,
  required final TimeOfDayValue time,
  final int? weekday,
}) with Equatable {
  factory fromMap(Map<String, dynamic> map) => RitualSchedule(
    id: map['id'] as String,
    cadence: map['cadence'] as String,
    weekday: map['weekday'] as int?,
    time: TimeOfDayValue.fromMap(map['time'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    'id': id,
    'cadence': cadence,
    'weekday': weekday,
    'time': time.toMap(),
  };

  /// The reminder moments in the [days] days from [now], one per matching day.
  ///
  /// Biweekly rituals fall on every other week by ISO week number, monthly ones on the first
  /// matching weekday of each month.
  List<ReminderCandidate> candidates(DateTime now, {required int days}) {
    final result = <ReminderCandidate>[];
    for (var offset = 0; offset < days; offset++) {
      final day = DateTime(now.year, now.month, now.day + offset, time.hour, time.minute);
      if (_matches(day)) {
        result.add(ReminderCandidate(kind: ReminderKind.followUp, at: day, key: 'ritual-$id'));
      }
    }

    return result;
  }

  bool _matches(DateTime day) {
    if (cadence == 'daily') return true;
    if (weekday == null || day.weekday % 7 != weekday) return false;

    return switch (cadence) {
      'weekly' => true,
      'biweekly' => _isoWeek(day).isEven,
      'monthly' => day.day <= 7,
      _ => false,
    };
  }

  int _isoWeek(DateTime date) {
    final dayOfYear = date.difference(DateTime(date.year)).inDays + 1;

    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }

  @override
  List<Object?> get props => [id, cadence, weekday, time];
}
