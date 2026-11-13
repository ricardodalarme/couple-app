import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/local/today_local_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/data_sources/remote/today_data_source.dart';
import 'package:flutter_bloc_starter/features/today/data/mappers/today_home_mapper.dart';
import 'package:flutter_bloc_starter/features/today/data/models/today_home.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

/// The Hoje state, whether it came from the device cache, and a pending unpair notice.
typedef TodayResult = ({
  TodayHome home,
  bool isFromCache,
  bool wasUnpaired,
  String? previousPartnerName,
});

class TodayRepository({
  required final TodayDataSource _dataSource,
  required final TodayLocalDataSource _localDataSource,
  final WidgetsRepository? _widgetsRepository,
}) {
  final Logger _logger = Logger('TodayRepository');

  /// Reads Hoje from the server, falling back to the last cached state when offline.
  Future<TodayResult> getToday() async {
    try {
      final home = (await _dataSource.getHome()).toModel();
      if (home == null) throw const NoDataException();
      await _localDataSource.write(home);
      final previous = _localDataSource.readRelationship();
      final wasUnpaired = !home.isPaired && previous.wasPaired;
      if (home.isPaired) {
        await _localDataSource.writeRelationship(wasPaired: true, partnerName: home.partnerName);
      }
      return (
        home: home,
        isFromCache: false,
        wasUnpaired: wasUnpaired,
        previousPartnerName: wasUnpaired ? previous.partnerName : null,
      );
    } catch (e, stack) {
      final cached = _localDataSource.read();
      if (cached != null && e is LocalizedException && e.l10nKey == networkErrorCode) {
        return (home: cached, isFromCache: true, wasUnpaired: false, previousPartnerName: null);
      }
      _logger.error('Failed to load Hoje', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Ends the person's own pause so Hoje returns to normal.
  Future<void> endPause() async {
    try {
      await _dataSource.endPause();
      unawaited(_widgetsRepository?.syncQuietly());
    } catch (e, stack) {
      _logger.error('Failed to end the pause', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Marks the unpair notice as seen so it does not come back.
  Future<void> acknowledgeUnpair() => _localDataSource.writeRelationship(wasPaired: false);

  /// Forgets the cached state and the last pairing state, for sign-out and unpair.
  Future<void> clearCache() => _localDataSource.clear();
}
