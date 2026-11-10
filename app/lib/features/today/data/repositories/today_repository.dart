import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/today_local_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/mappers/today_home_mapper.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

/// The Hoje state and whether it came from the device cache because the network failed.
typedef TodayResult = ({TodayHome home, bool isFromCache});

class TodayRepository({
  required final TodayDataSource _dataSource,
  required final TodayLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('TodayRepository');

  /// Reads Hoje from the server, falling back to the last cached state when offline.
  Future<TodayResult> getToday() async {
    try {
      final home = (await _dataSource.getHome()).toModel();
      if (home == null) throw const NoDataException();
      await _localDataSource.write(home);
      return (home: home, isFromCache: false);
    } catch (e, stack) {
      final cached = _localDataSource.read();
      if (cached != null && e is LocalizedException && e.l10nKey == networkErrorCode) {
        return (home: cached, isFromCache: true);
      }
      _logger.error('Failed to load Hoje', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Forgets the cached state, for sign-out and unpair.
  Future<void> clearCache() => _localDataSource.clear();
}
