import 'package:clock/clock.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/important_date_kind.dart';
import 'package:flutter_bloc_starter/features/dates/data/repositories/dates_repository.dart';
import 'package:flutter_bloc_starter/features/distance/data/data_sources/remote/distance_data_source.dart';
import 'package:flutter_bloc_starter/features/distance/data/models/distance_info.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:logger/logger.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

class DistanceRepository({
  required final DistanceDataSource _dataSource,
  required final ProfileRepository _profileRepository,
  required final DatesRepository _datesRepository,
}) {
  final Logger _logger = Logger('DistanceRepository');
  bool _hasZones = false;

  /// Both clocks and the days until the next saved reunion date.
  Future<DistanceInfo> getDistance({DateTime? now}) async {
    try {
      final moment = now ?? clock.now();
      final settings = await _profileRepository.getMySettings();
      final partnerZone = await _dataSource.getPartnerTimeZone();
      final reunion = await _nextReunion(moment);

      return DistanceInfo(
        own: _clock(settings.timeZone, moment),
        partner: partnerZone == null ? null : _clock(partnerZone, moment),
        nextReunion: reunion?.date,
        daysToReunion: reunion?.days,
        reunionTitle: reunion?.title,
      );
    } catch (e, stack) {
      _logger.error('Failed to read the distance', error: e, stackTrace: stack);
      rethrow;
    }
  }

  ZoneClock _clock(String zone, DateTime moment) {
    if (!_hasZones) {
      tz_data.initializeTimeZones();
      _hasZones = true;
    }
    try {
      final local = tz.TZDateTime.from(moment.toUtc(), tz.getLocation(zone));

      return ZoneClock(
        zone: zone,
        time: DateTime(local.year, local.month, local.day, local.hour, local.minute),
      );
    } on Object {
      return ZoneClock(zone: zone, time: moment);
    }
  }

  Future<({DateTime date, int days, String title})?> _nextReunion(DateTime moment) async {
    final today = DateTime.utc(moment.year, moment.month, moment.day);
    ({DateTime date, int days, String title})? best;
    for (final item in await _datesRepository.getDates()) {
      if (item.kind != ImportantDateKind.reunion) continue;
      final date = nextOccurrence(
        month: item.month,
        day: item.day,
        year: item.year,
        isYearly: item.isYearly,
        today: today,
      );
      if (date == null) continue;
      if (best == null || date.isBefore(best.date)) {
        best = (date: date, days: date.difference(today).inDays, title: item.title);
      }
    }

    return best;
  }
}
