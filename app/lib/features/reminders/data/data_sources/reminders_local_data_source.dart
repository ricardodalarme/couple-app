import 'dart:convert';

import 'package:flutter_bloc_starter/features/reminders/data/models/reminder_preferences.dart';
import 'package:preferences_service/preferences_service.dart';

class RemindersLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _key = 'reminderPreferences';

  ReminderPreferences read() {
    final raw = _preferencesService.readString(key: _key);
    if (raw == null) return const ReminderPreferences();

    try {
      return ReminderPreferences.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return const ReminderPreferences();
    }
  }

  Future<void> write(ReminderPreferences preferences) =>
      _preferencesService.writeString(key: _key, value: jsonEncode(preferences.toMap()));
}
