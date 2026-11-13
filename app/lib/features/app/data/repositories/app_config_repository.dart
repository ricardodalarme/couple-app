import 'package:flutter_bloc_starter/features/app/data/data_sources/remote/app_config_data_source.dart';
import 'package:logger/logger.dart';

class AppConfigRepository({required final AppConfigDataSource _dataSource}) {
  final Logger _logger = Logger('AppConfigRepository');

  Future<String?> getMinAppVersion() async {
    try {
      return await _dataSource.getMinAppVersion();
    } catch (e, stack) {
      _logger.warning('Could not read the minimum app version', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
