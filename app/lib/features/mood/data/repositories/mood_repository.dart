import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/remote/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/mappers/mood_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/mood/data/mappers/mood_record_mapper.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_entry.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:logger/logger.dart';

/// Today's own mood and the partner's name for the share title.
typedef MoodToday = ({MoodEntry? entry, String? partnerName});

class MoodRepository({required final MoodDataSource _dataSource}) {
  final Logger _logger = Logger('MoodRepository');

  Future<MoodToday> getTodayMood() => _run("read today's mood", () async {
    final today = await _dataSource.getTodayMood();

    return (entry: today.mood?.toEntry(), partnerName: today.partnerName);
  });

  /// Updates today's row when it exists and inserts it otherwise, so the latest save wins.
  Future<MoodEntry> saveMood({required MoodKind mood, required MoodShare share, NeedKind? need}) =>
      _run("save today's mood", () async {
        final today = await _dataSource.getTodayMood();
        final existing = today.mood;
        if (existing != null) {
          return _update(id: existing.id, day: today.day, mood: mood, need: need, share: share);
        }

        try {
          final record = await _dataSource.insertMood(
            mood: mood.toRemote(),
            need: need?.toRemote(),
            share: share.toRemote(),
            day: today.day,
          );

          return record.toEntry();
        } on LocalizedException catch (exception) {
          if (!_isUniqueViolation(exception)) rethrow;
          final raced = await _dataSource.getTodayMood();
          final row = raced.mood;
          if (row == null) rethrow;

          return _update(id: row.id, day: raced.day, mood: mood, need: need, share: share);
        }
      });

  Future<MoodEntry> _update({
    required String id,
    required DateTime day,
    required MoodKind mood,
    required NeedKind? need,
    required MoodShare share,
  }) async {
    final record = need == null
        ? await _dataSource.clearNeed(
            id: id,
            mood: mood.toRemote(),
            share: share.toRemote(),
            day: day,
          )
        : await _dataSource.updateMood(
            id: id,
            mood: mood.toRemote(),
            need: need.toRemote(),
            share: share.toRemote(),
            day: day,
          );

    return record.toEntry();
  }

  bool _isUniqueViolation(LocalizedException exception) =>
      exception.l10nKey == '23505' || exception.l10nKey.toLowerCase().contains('duplicate key');

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
