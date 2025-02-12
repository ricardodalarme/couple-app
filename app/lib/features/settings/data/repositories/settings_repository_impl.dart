import 'dart:async';

import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/models/settings_local.dart';
import 'package:quickstart_flutter_bloc/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/models/settings_model.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({
    required SettingsLocalDataSource localDataSource,
    required Mapper<SettingsLocal, SettingsModel> settingsLocalToModelMapper,
    required Mapper<SettingsModel, SettingsLocal> settingsModelToLocalMapper,
  }) : _localDataSource = localDataSource,
       _settingsLocalToModelMapper = settingsLocalToModelMapper,
       _settingsModelToLocalMapper = settingsModelToLocalMapper;

  final SettingsLocalDataSource _localDataSource;
  final Mapper<SettingsLocal, SettingsModel> _settingsLocalToModelMapper;
  final Mapper<SettingsModel, SettingsLocal> _settingsModelToLocalMapper;

  @override
  SettingsModel get() {
    final SettingsLocal? settingsLocal = _localDataSource.get();

    return settingsLocal != null
        ? _settingsLocalToModelMapper.map(settingsLocal)
        : const SettingsModel.empty();
  }

  @override
  Future<void> save(SettingsModel settings) async {
    await _localDataSource.save(_settingsModelToLocalMapper.map(settings));
  }
}
