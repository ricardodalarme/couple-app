import 'dart:convert';

import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:preferences_service/preferences_service.dart';

class SettingsLocalDataSource {
  SettingsLocalDataSource({required PreferencesService preferencesService})
    : _preferencesService = preferencesService;

  final PreferencesService _preferencesService;

  static const _key = 'settings';

  Future<void> save(Settings settings) async {
    final Map<String, dynamic> settingsLocalMap = settings.toMap();
    final String settingsLocalMapInString = jsonEncode(settingsLocalMap);

    await _preferencesService.writeString(key: _key, value: settingsLocalMapInString);
  }

  Settings? get() {
    final String? settingsLocalMapInString = _preferencesService.readString(key: _key);

    if (settingsLocalMapInString != null) {
      final settingsLocalMap = jsonDecode(settingsLocalMapInString) as Map<String, dynamic>;
      return Settings.fromMap(settingsLocalMap);
    }

    return null;
  }
}
