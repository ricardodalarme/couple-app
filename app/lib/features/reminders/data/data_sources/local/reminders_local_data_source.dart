import 'dart:convert';

import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:flutter_bloc_starter/features/reminders/data/models/ritual_schedule.dart';
import 'package:preferences_service/preferences_service.dart';

class RemindersLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _key = 'reminderPreferences';
  static const _customKey = 'customReminders';
  static const _followUpKey = 'followUpReminders';
  static const _ritualKey = 'ritualSchedules';

  ReminderPreferences read() {
    final raw = _preferencesService.readString(key: _key);
    if (raw == null) return const ReminderPreferences();

    try {
      return ReminderPreferences.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return const ReminderPreferences();
    }
  }

  /// One-off moments the person asked for, such as "later" on an idea.
  List<DateTime> readCustom() {
    final raw = _preferencesService.readString(key: _customKey);
    if (raw == null) return const [];

    try {
      return (jsonDecode(raw) as List<dynamic>).cast<String>().map(DateTime.parse).toList();
    } on Object {
      return const [];
    }
  }

  Future<void> writeCustom(List<DateTime> moments) => _preferencesService.writeString(
    key: _customKey,
    value: jsonEncode([for (final moment in moments) moment.toIso8601String()]),
  );

  /// One-off follow-up moments the person asked for after a repair.
  List<DateTime> readFollowUps() {
    final raw = _preferencesService.readString(key: _followUpKey);
    if (raw == null) return const [];

    try {
      return (jsonDecode(raw) as List<dynamic>).cast<String>().map(DateTime.parse).toList();
    } on Object {
      return const [];
    }
  }

  Future<void> writeFollowUps(List<DateTime> moments) => _preferencesService.writeString(
    key: _followUpKey,
    value: jsonEncode([for (final moment in moments) moment.toIso8601String()]),
  );

  /// The schedules of the rituals whose reminder is on.
  List<RitualSchedule> readRituals() {
    final raw = _preferencesService.readString(key: _ritualKey);
    if (raw == null) return const [];

    try {
      return [
        for (final item in jsonDecode(raw) as List<dynamic>)
          RitualSchedule.fromMap(item as Map<String, dynamic>),
      ];
    } on Object {
      return const [];
    }
  }

  Future<void> writeRituals(List<RitualSchedule> schedules) => _preferencesService.writeString(
    key: _ritualKey,
    value: jsonEncode([for (final schedule in schedules) schedule.toMap()]),
  );

  Future<void> write(ReminderPreferences preferences) =>
      _preferencesService.writeString(key: _key, value: jsonEncode(preferences.toMap()));
}
