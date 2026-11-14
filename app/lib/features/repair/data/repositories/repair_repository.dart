import 'dart:async';

import 'package:flutter_bloc_starter/features/repair/data/data_sources/remote/repair_data_source.dart';
import 'package:flutter_bloc_starter/features/repair/data/mappers/repair_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/received_signal.dart';
import 'package:flutter_bloc_starter/features/repair/data/models/repair_path.dart';
import 'package:logger/logger.dart';

class RepairRepository({required final RepairDataSource _dataSource}) {
  final Logger _logger = Logger('RepairRepository');
  final StreamController<void> _pauseChanges = StreamController<void>.broadcast();

  /// Emits whenever the person starts a pause, so Hoje can read again.
  Stream<void> get onPauseChanged => _pauseChanges.stream;

  /// Stores the private temperature answer.
  Future<void> recordTemperature(Temperature level) async {
    try {
      await _dataSource.recordTemperature(level.toRemote());
    } catch (e, stack) {
      _logger.error('Failed to record the temperature', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Sends the partner a short repair message; [preset] names a ready-made one, if used.
  Future<void> sendRepair({required String message, String? preset}) async {
    try {
      await _dataSource.sendRepair(body: message.trim(), value: preset);
    } catch (e, stack) {
      _logger.error('Failed to send a repair message', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The guided repair the person left unfinished, if any.
  Future<GuidedSession?> openGuidedSession() async {
    try {
      final node = await _dataSource.openGuidedSession();

      return node == null
          ? null
          : GuidedSession.fromStored(id: node.id, step: node.step, draft: node.draft);
    } catch (e, stack) {
      _logger.error('Failed to read the guided repair', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves where the person is in the guided repair, so it can be resumed later.
  Future<void> saveProgress(GuidedSession session) async {
    try {
      await _dataSource.saveProgress(id: session.id, step: session.step, draft: session.draft);
    } catch (e, stack) {
      _logger.error('Failed to save repair progress', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Closes the guided repair with how the person feels now.
  Future<void> completeSession({
    required String id,
    required DateTime now,
    RepairFeeling? feeling,
  }) async {
    try {
      await _dataSource.completeSession(id: id, completedAt: now, feeling: feeling?.toRemote());
    } catch (e, stack) {
      _logger.error('Failed to complete the repair', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<List<Learning>> getLearnings() async {
    try {
      return [
        for (final node in await _dataSource.getLearnings())
          Learning(
            id: node.id,
            kind: node.kind.toModel(),
            note: node.note,
            createdAt: node.createdAt,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read learnings', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> saveLearning({
    required String id,
    required RepairLearningKind kind,
    required String note,
    String? sessionId,
  }) async {
    try {
      await _dataSource.saveLearning(
        id: id,
        kind: kind.toRemote(),
        note: note.trim(),
        sessionId: sessionId,
      );
    } catch (e, stack) {
      _logger.error('Failed to save a learning', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> deleteLearning(String id) async {
    try {
      await _dataSource.deleteLearning(id);
    } catch (e, stack) {
      _logger.error('Failed to delete a learning', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// The partner's messages the person has not answered yet, newest first.
  Future<List<ReceivedSignal>> getReceivedSignals(String recipientId) async {
    try {
      return [
        for (final node in await _dataSource.getReceivedSignals(recipientId))
          ReceivedSignal(
            id: node.id,
            kind: node.kind.toModel(),
            createdAt: node.createdAt,
            value: node.value,
            body: node.body,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read received messages', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Answers a message from the partner; a null [response] only marks it seen.
  Future<void> respondToSignal({required String signalId, RepairResponse? response}) async {
    try {
      await _dataSource.respondToSignal(signalId: signalId, response: response?.toRpc());
    } catch (e, stack) {
      _logger.error('Failed to answer a message', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Asks the partner for space until [returnAt] with a short [message].
  Future<void> startPause({required DateTime returnAt, String? message}) async {
    try {
      await _dataSource.startPause(returnAt: returnAt, message: message?.trim());
      _pauseChanges.add(null);
    } catch (e, stack) {
      _logger.error('Failed to start a pause', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Starts a private repair session with the chosen [path]; the client [id] makes retries safe.
  Future<void> startSession({required String id, required RepairPath path, int? intensity}) async {
    try {
      await _dataSource.startSession(id: id, path: path.toRemote(), intensity: intensity);
    } catch (e, stack) {
      _logger.error('Failed to start a repair session', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
