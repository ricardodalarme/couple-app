import 'dart:convert';

import 'package:persistent_storage_service/persistent_storage_service.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/models/settings_local.dart';

abstract interface class SettingsLocalDataSource {
  Future<void> save(SettingsLocal settings);

  SettingsLocal? get();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  SettingsLocalDataSourceImpl({required PersistentStorageService storage}) : _storage = storage;

  final PersistentStorageService _storage;

  static const _key = 'settings';

  @override
  Future<void> save(SettingsLocal settings) async {
    final Map<String, dynamic> settingsLocalMap = settings.toMap();
    final String settingsLocalMapInString = jsonEncode(settingsLocalMap);

    await _storage.writeString(key: _key, value: settingsLocalMapInString);
  }

  @override
  SettingsLocal? get() {
    final String? settingsLocalMapInString = _storage.readString(key: _key);

    if (settingsLocalMapInString != null) {
      final settingsLocalMap = jsonDecode(settingsLocalMapInString) as Map<String, dynamic>;
      return SettingsLocal.fromMap(settingsLocalMap);
    }

    return null;
  }
}
