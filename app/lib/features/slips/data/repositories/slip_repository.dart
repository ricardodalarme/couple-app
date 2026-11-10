import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_local_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/pending_slip.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_draft.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

/// Where a saved slip ended up.
enum SlipSaveOutcome() {
  /// The server has it.
  synced,

  /// Kept on the device and sent when the connection is back.
  queued,
}

class SlipRepository({
  required final SlipDataSource _slipDataSource,
  required final SlipLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('SlipRepository');

  /// Saves a slip, or keeps it on the device when there is no connection.
  ///
  /// The client-generated [id] makes retries safe.
  Future<SlipSaveOutcome> saveQuick({
    required String id,
    required String body,
    required DateTime createdAt,
    String? category,
  }) async {
    final slip = PendingSlip(id: id, body: body, createdAt: createdAt, category: category);
    try {
      await _send(slip);
      return SlipSaveOutcome.synced;
    } catch (e, stack) {
      if (!_isOffline(e)) {
        _logger.error('Failed to save a slip', error: e, stackTrace: stack);
        rethrow;
      }
      await _enqueue(slip);
      return SlipSaveOutcome.queued;
    }
  }

  /// Removes a slip that was just saved, whether or not it reached the server.
  Future<void> undo(String id) async {
    final pending = _localDataSource.readPending();
    if (pending.any((slip) => slip.id == id)) {
      await _localDataSource.writePending(pending.where((slip) => slip.id != id).toList());
      return;
    }

    try {
      await _slipDataSource.deleteSlip(id);
    } catch (e, stack) {
      _logger.error('Failed to undo a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends every slip kept on the device; stops at the first one that still cannot go.
  Future<void> flushPending() async {
    for (final slip in _localDataSource.readPending()) {
      try {
        await _send(slip);
      } catch (e, stack) {
        _logger.warning('A pending slip is still waiting', error: e, stackTrace: stack);
        return;
      }
      final remaining = _localDataSource.readPending().where((item) => item.id != slip.id);
      await _localDataSource.writePending(remaining.toList());
    }
  }

  SlipDraft? readDraft(DateTime now) {
    final draft = _localDataSource.readDraft();

    return draft != null && draft.isFresh(now) ? draft : null;
  }

  Future<void> saveDraft({required String text, required DateTime now, String? category}) {
    if (text.trim().isEmpty && category == null) return _localDataSource.clearDraft();

    return _localDataSource.writeDraft(SlipDraft(text: text, savedAt: now, category: category));
  }

  Future<void> clearDraft() => _localDataSource.clearDraft();

  Future<void> _send(PendingSlip slip) async {
    await _slipDataSource.saveSlip(id: slip.id, body: slip.body, createdAt: slip.createdAt);
    if (slip.category != null) {
      await _slipDataSource.setCategory(id: slip.id, category: slip.category);
    }
  }

  Future<void> _enqueue(PendingSlip slip) async {
    final pending = _localDataSource.readPending();
    await _localDataSource.writePending([...pending.where((item) => item.id != slip.id), slip]);
  }

  bool _isOffline(Object error) => error is LocalizedException && error.l10nKey == networkErrorCode;
}
