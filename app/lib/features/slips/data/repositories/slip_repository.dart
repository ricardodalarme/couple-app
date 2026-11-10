import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_local_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/pending_slip.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_detail.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_draft.dart';
import 'package:flutter_bloc_starter/features/slips/data/models/slip_entry.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';

/// How many slips one page holds.
const int slipPageSize = 20;

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
  final StreamController<void> _changes = StreamController<void>.broadcast();

  /// How many slips are waiting on the device for a connection.
  int get pendingCount => _localDataSource.readPending().length;

  /// Emits whenever a slip is saved, undone or sent, so lists can read again.
  Stream<void> get onChanged => _changes.stream;

  /// Saves a slip, or keeps it on the device when there is no connection.
  ///
  /// The client-generated [id] makes retries safe.
  Future<SlipSaveOutcome> saveQuick({
    required String id,
    required String body,
    required DateTime createdAt,
    String? category,
    String kind = 'quick',
    String? feeling,
    String? planNote,
    String? workArea,
  }) async {
    final slip = PendingSlip(
      id: id,
      body: body,
      createdAt: createdAt,
      category: category,
      kind: kind,
      feeling: feeling,
      planNote: planNote,
      workArea: workArea,
    );
    try {
      await _send(slip);
      _changes.add(null);
      return SlipSaveOutcome.synced;
    } catch (e, stack) {
      if (!_isOffline(e)) {
        _logger.error('Failed to save a slip', error: e, stackTrace: stack);
        rethrow;
      }
      await _enqueue(slip);
      _changes.add(null);
      return SlipSaveOutcome.queued;
    }
  }

  /// Reads one slip; returns null when it is deleted or not the person's.
  Future<SlipDetail?> getSlip(String id) async {
    try {
      final node = await _slipDataSource.getSlip(id);
      if (node == null) return null;

      return SlipDetail(
        id: node.id,
        body: node.body,
        kind: node.kind.name,
        createdAt: node.createdAt,
        forCard: node.forCard,
        feeling: node.feeling,
        planNote: node.planNote,
        category: node.category,
        workArea: node.workArea,
        isArchived: node.archivedAt != null,
        isInJar: node.inJar,
        wasInCard: node.cardItemsCollection?.edges.isNotEmpty ?? false,
      );
    } catch (e, stack) {
      _logger.error('Failed to load a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves the edited text and card choice of an existing slip.
  Future<void> updateSlip(SlipDetail slip) async {
    try {
      await _slipDataSource.saveSlip(
        id: slip.id,
        body: slip.body.trim(),
        createdAt: slip.createdAt,
        kind: slip.kind,
        feeling: slip.feeling,
        planNote: slip.planNote,
        forCard: slip.forCard && slip.canGoInCard,
      );
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to update a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Puts the slip in the jar of good moments, or takes it out.
  Future<void> setInJar({required String id, required bool inJar}) async {
    try {
      await _slipDataSource.setInJar(id: id, inJar: inJar);
    } catch (e, stack) {
      _logger.error('Failed to update the jar', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> setArchived({required String id, required bool archived}) async {
    try {
      await _slipDataSource.archiveSlip(id: id, archived: archived);
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to archive a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> deleteSlip(String id) async {
    try {
      await _slipDataSource.deleteSlip(id);
      _changes.add(null);
    } catch (e, stack) {
      _logger.error('Failed to delete a slip', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Tells the partner something gentle, such as a need; throws when there is no partner.
  Future<void> sendNeed(String need) async {
    try {
      await _slipDataSource.sendSignal(kind: 'need', value: need);
    } catch (e, stack) {
      _logger.error('Failed to send a need', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Reads a page of the person's slips, newest first; [since] limits it to recent ones.
  Future<SlipPage> getSlips({String? after, DateTime? since, int pageSize = slipPageSize}) async {
    try {
      final result = await _slipDataSource.getSlips(first: pageSize, after: after, since: since);

      return SlipPage(
        items: [
          for (final edge in result.edges)
            SlipEntry(
              id: edge.node.id,
              body: edge.node.body,
              category: edge.node.category,
              createdAt: edge.node.createdAt,
            ),
        ],
        hasNext: result.pageInfo.hasNextPage,
        cursor: result.pageInfo.endCursor,
      );
    } catch (e, stack) {
      _logger.error('Failed to load slips', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Keeps a slip only on the device; it is sent once there is a signed-in session.
  Future<void> keepOnDevice({
    required String id,
    required String body,
    required DateTime createdAt,
  }) => _enqueue(PendingSlip(id: id, body: body, createdAt: createdAt));

  /// Removes a slip that was just saved, whether or not it reached the server.
  Future<void> undo(String id) async {
    final pending = _localDataSource.readPending();
    if (pending.any((slip) => slip.id == id)) {
      await _localDataSource.writePending(pending.where((slip) => slip.id != id).toList());
      _changes.add(null);
      return;
    }

    try {
      await _slipDataSource.deleteSlip(id);
      _changes.add(null);
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
      _changes.add(null);
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
    await _slipDataSource.saveSlip(
      id: slip.id,
      body: slip.body,
      createdAt: slip.createdAt,
      kind: slip.kind,
      feeling: slip.feeling,
      planNote: slip.planNote,
    );
    if (slip.category != null) {
      await _slipDataSource.setCategory(id: slip.id, category: slip.category);
    }
    if (slip.workArea != null) {
      await _slipDataSource.setWorkArea(id: slip.id, workArea: slip.workArea!);
    }
  }

  Future<void> _enqueue(PendingSlip slip) async {
    final pending = _localDataSource.readPending();
    await _localDataSource.writePending([...pending.where((item) => item.id != slip.id), slip]);
  }

  bool _isOffline(Object error) => error is LocalizedException && error.l10nKey == networkErrorCode;
}
