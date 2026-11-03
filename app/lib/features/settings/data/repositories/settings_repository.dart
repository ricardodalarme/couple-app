import 'dart:async';

import 'package:flutter_bloc_starter/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:logger/logger.dart';

class SettingsRepository({required final SettingsLocalDataSource _localDataSource}) {
  final Logger _logger = Logger('SettingsRepository');
  Settings get() {
    final settings = _localDataSource.get();
    final result = settings ?? const Settings.empty();
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
