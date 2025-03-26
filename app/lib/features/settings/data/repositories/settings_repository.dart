import 'dart:async';

import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final SettingsLocalDataSource _localDataSource;

  Settings get() {
    final Settings? settings = _localDataSource.get();
    return settings ?? const Settings.empty();
  }

  Future<void> save(Settings settings) async {
    await _localDataSource.save(settings);
  }
}
