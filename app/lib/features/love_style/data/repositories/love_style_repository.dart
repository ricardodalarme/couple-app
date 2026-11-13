import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/local/love_style_local_data_source.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/remote/love_style_data_source.dart';
import 'package:logger/logger.dart';

class LoveStyleRepository({
  required final LoveStyleDataSource _dataSource,
  required final LoveStyleLocalDataSource _localDataSource,
  required final AuthenticationRepository _authenticationRepository,
}) {
  static const int _manualValueLimit = 1000;
  static const int _shareBodyLimit = 280;

  final Logger _logger = Logger('LoveStyleRepository');

  /// The ranked patterns already saved, or null when the exercise was never finished.
  Future<List<String>?> getSavedRanked() async {
    try {
      return (await _dataSource.getResult())?.ranked;
    } catch (e, stack) {
      _logger.error('Failed to read the love-style result', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The stored share id while the message still exists, or null when it is gone.
  Future<String?> getSharedMessageId() async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) return null;
    final stored = _localDataSource.readSharedMessageId(userId);
    if (stored == null) return null;

    try {
      if (await _dataSource.sharedMessageExists(stored)) return stored;
      await _localDataSource.clearSharedMessageId(userId);

      return null;
    } catch (e, stack) {
      _logger.error('Failed to check the love-style share', error: e, stackTrace: stack);

      return stored;
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
      _logger.error('Failed to save the love-style result', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The saved `loved` manual value, whether it is private or shared with the partner.
  Future<String?> getManualEntry() async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) return null;

    try {
      return (await _dataSource.getManualEntry(userId))?.value;
    } catch (e, stack) {
      _logger.error('Failed to read the love-style manual entry', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Inserts the `loved` manual entry, or updates it when the person already has one.
  Future<void> saveManualEntry(String value) async {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    final bounded = trimmed.length > _manualValueLimit
        ? trimmed.substring(0, _manualValueLimit)
        : trimmed;
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) throw const LocalizedException(l10nKey: 'UNAUTHENTICATED');

    try {
      final saved = await _dataSource.getManualEntry(userId);
      if (saved != null) {
        await _dataSource.updateManualEntry(id: saved.id, value: bounded);

        return;
      }

      try {
        await _dataSource.insertManualEntry(bounded);
      } on LocalizedException catch (exception) {
        if (!_isUniqueViolation(exception)) rethrow;
        final raced = await _dataSource.getManualEntry(userId);
        if (raced == null) rethrow;
        await _dataSource.updateManualEntry(id: raced.id, value: bounded);
      }
    } catch (e, stack) {
      _logger.error('Failed to save the love-style manual entry', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the short description to the partner and returns the message id.
  Future<String> share(String body) async {
    final trimmed = body.trim();
    final bounded = trimmed.length > _shareBodyLimit
        ? trimmed.substring(0, _shareBodyLimit)
        : trimmed;
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) throw const LocalizedException(l10nKey: 'UNAUTHENTICATED');

    try {
      final id = await _dataSource.shareMessage(bounded);
      await _localDataSource.writeSharedMessageId(userId: userId, id: id);

      return id;
    } catch (e, stack) {
      _logger.error('Failed to share the love-style result', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Removes the shared note so it stops appearing for the partner.
  Future<void> revokeShare(String messageId) async {
    final userId = _authenticationRepository.currentUserId;

    try {
      await _dataSource.revokeShare(messageId);
    } catch (e, stack) {
      _logger.error('Failed to revoke the love-style share', error: e, stackTrace: stack);
      rethrow;
    }

    if (userId != null) await _localDataSource.clearSharedMessageId(userId);
  }

  bool _isUniqueViolation(LocalizedException exception) =>
      exception.l10nKey == '23505' || exception.l10nKey.toLowerCase().contains('duplicate key');
}
