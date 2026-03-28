import 'dart:async';

import 'package:logger/logger.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/models/settings.dart';

class SettingsRepository {
  SettingsRepository({required SettingsLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  final Logger _logger = Logger('SettingsRepository');
  final SettingsLocalDataSource _localDataSource;

  Settings get() {
    final Settings? settings = _localDataSource.get();
    final Settings result = settings ?? const Settings.empty();
    _logger.trace('Loaded settings: $result');
    return result;
  }

  Future<void> save(Settings settings) async {
    _logger.info('Saving settings');
    try {
      await _localDataSource.save(settings);
      _logger.info('Settings saved');
    } catch (e, stack) {
      _logger.error('Failed to save settings', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
