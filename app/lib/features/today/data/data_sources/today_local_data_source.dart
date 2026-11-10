import 'dart:convert';

import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:preferences_service/preferences_service.dart';

/// Keeps the last Hoje state so a cold start without a connection still shows something.
class TodayLocalDataSource({required final PreferencesService _preferencesService}) {
  static const _key = 'todayCache';

  TodayHome? read() {
    final raw = _preferencesService.readString(key: _key);
    if (raw == null) return null;

    try {
      return TodayHome.fromMap(jsonDecode(raw) as Map<String, dynamic>);
    } on Object {
      return null;
    }
  }

  Future<void> write(TodayHome home) =>
      _preferencesService.writeString(key: _key, value: jsonEncode(home.toMap()));

  Future<void> clear() => _preferencesService.delete(key: _key);
}
