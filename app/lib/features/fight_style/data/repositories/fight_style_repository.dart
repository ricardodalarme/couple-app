import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/fight_style/data/data_sources/remote/fight_style_data_source.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class FightStyleRepository({required final FightStyleDataSource _dataSource}) {
  final Logger _logger = Logger('FightStyleRepository');
  final Uuid _uuid = const Uuid();

  /// The ranked patterns already saved, or null when the exercise was never finished.
  Future<List<String>?> getSavedRanked() async {
    try {
      return (await _dataSource.getResult())?.ranked;
    } catch (e, stack) {
      _logger.error('Failed to read the reaction result', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Stores the latest ranking, updating the saved row so a retake replaces it.
  Future<void> saveRanked(List<String> ranked) async {
    try {
      final saved = await _dataSource.getResult();
      if (saved != null) {
        await _dataSource.updateResult(id: saved.id, ranked: ranked);

        return;
      }

      try {
        await _dataSource.insertResult(ranked);
      } on LocalizedException catch (exception) {
        if (!_isUniqueViolation(exception)) rethrow;
        final raced = await _dataSource.getResult();
        if (raced == null) rethrow;
        await _dataSource.updateResult(id: raced.id, ranked: ranked);
      }
    } catch (e, stack) {
      _logger.error('Failed to save the reaction result', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves the result description as a private repair tool, with no partner sharing.
  Future<void> addRepairTool(String note) async {
    try {
      await _dataSource.addRepairTool(id: _uuid.v4(), note: note.trim());
    } catch (e, stack) {
      _logger.error('Failed to add a repair tool', error: e, stackTrace: stack);
      rethrow;
    }
  }

  bool _isUniqueViolation(LocalizedException exception) =>
      exception.l10nKey == '23505' || exception.l10nKey.toLowerCase().contains('duplicate key');
}
