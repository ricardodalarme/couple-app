import 'dart:convert';

import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';

class SettingsLocalDataSource {
  SettingsLocalDataSource({required PersistentStorageService storage}) : _storage = storage;

  final PersistentStorageService _storage;

  static const _key = 'settings';

  Future<void> save(Settings settings) async {
    final Map<String, dynamic> settingsLocalMap = settings.toMap();
    final String settingsLocalMapInString = jsonEncode(settingsLocalMap);

    await _storage.writeString(key: _key, value: settingsLocalMapInString);
  }

  Settings? get() {
    final String? settingsLocalMapInString = _storage.readString(key: _key);

    if (settingsLocalMapInString != null) {
      final settingsLocalMap = jsonDecode(settingsLocalMapInString) as Map<String, dynamic>;
      return Settings.fromMap(settingsLocalMap);
    }

    return null;
  }
}
