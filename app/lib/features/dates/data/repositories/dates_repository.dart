import 'package:flutter_bloc_starter/features/dates/data/data_sources/dates_data_source.dart';
import 'package:flutter_bloc_starter/features/dates/data/models/dates_models.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class DatesRepository({
  required final DatesDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
}) {
  final Logger _logger = Logger('DatesRepository');

  Future<List<ImportantDate>> getDates() => _run(
    'read dates',
    () async => [
      for (final node in await _dataSource.getDates())
        ImportantDate(
          id: node.id,
          title: node.title,
          kind: node.kind,
          month: node.month,
          day: node.day,
          year: node.year,
          isYearly: node.yearly,
        ),
    ],
  );

  /// Adds a date shared with the partner when there is one, reminded 7 and 1 days before.
  Future<void> addDate({
    required String id,
    required String title,
    required String kind,
    required int month,
    required int day,
    int? year,
    bool isYearly = true,
    List<int> remindDays = const [7, 1],
    String? holidayKey,
  }) => _run(
    'add a date',
    () async => _dataSource.addDate(
      id: id,
      title: title.trim(),
      kind: kind,
      month: month,
      day: day,
      year: year,
      yearly: isYearly,
      remindDays: remindDays,
      origin: holidayKey == null ? 'manual' : 'auto',
      holidayKey: holidayKey,
      coupleId: await _togetherRepository.getCoupleId(),
    ),
  );

  Future<void> deleteDate(String id) => _run('delete a date', () => _dataSource.deleteDate(id));

  Future<List<GiftIdea>> getGiftIdeas() => _run(
    'read gift ideas',
    () async => [
      for (final node in await _dataSource.getGiftIdeas())
        GiftIdea(id: node.id, title: node.title, status: node.status),
    ],
  );

  Future<void> addGiftIdea({required String id, required String title}) =>
      _run('add a gift idea', () => _dataSource.addGiftIdea(id: id, title: title.trim()));

  Future<void> setGiftGiven({required String id, required bool isGiven}) => _run(
    'update a gift idea',
    () => _dataSource.setGiftIdeaStatus(id: id, status: isGiven ? 'given' : 'idea'),
  );

  Future<void> deleteGiftIdea(String id) =>
      _run('delete a gift idea', () => _dataSource.deleteGiftIdea(id));

  Future<List<Holiday>> getHolidays(String locale) => _run(
    'read holidays',
    () async => [
      for (final node in await _dataSource.getHolidays(locale))
        if (node.month != null && node.day != null)
          Holiday(slug: node.slug, title: node.title, month: node.month!, day: node.day!),
    ],
  );

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
