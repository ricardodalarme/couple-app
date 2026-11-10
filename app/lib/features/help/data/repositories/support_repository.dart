import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/support_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/support_local_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/models/pending_support_request.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:logger/logger.dart';
import 'package:network/network.dart';
import 'package:uuid/uuid.dart';

/// Where a support request ended up.
enum SupportSendOutcome() {
  /// The server has it.
  sent,

  /// Kept on the device and sent when the connection is back.
  queued,
}

class SupportRepository({
  required final SupportDataSource _dataSource,
  required final SupportLocalDataSource _localDataSource,
}) {
  final Logger _logger = Logger('SupportRepository');
  final Uuid _uuid = const Uuid();
  bool _isFlushing = false;

  /// Requests of [authorId] still waiting on the device.
  int pendingCount({required String authorId}) =>
      _localDataSource.readPending().where((request) => request.authorId == authorId).length;

  /// Sends a request, or keeps it on the device when there is no connection.
  Future<SupportSendOutcome> send({
    required String authorId,
    required SupportTopic topic,
    required String message,
    String? replyEmail,
    String? appVersion,
  }) async {
    final request = PendingSupportRequest(
      id: _uuid.v4(),
      authorId: authorId,
      topic: topic,
      message: message,
      createdAt: DateTime.now(),
      replyEmail: replyEmail,
      appVersion: appVersion,
    );
    try {
      await _send(request);
      return SupportSendOutcome.sent;
    } catch (e) {
      if (!_isOffline(e)) {
        _logger.error('Failed to send a support request (${_errorCode(e)})');
        rethrow;
      }
      await _enqueue(request);
      return SupportSendOutcome.queued;
    }
  }

  /// Sends the saved requests of [authorId].
  ///
  /// A request the server permanently rejects is dropped so the rest can go; a
  /// connection or rate-limit error stops the run and keeps the rest for later.
  /// Returns how many requests were dropped.
  Future<int> flushPending({required String authorId}) async {
    if (_isFlushing) return 0;
    _isFlushing = true;
    var dropped = 0;
    try {
      final waiting = _localDataSource
          .readPending()
          .where((request) => request.authorId == authorId)
          .toList();
      for (final request in waiting) {
        try {
          await _send(request);
        } catch (e) {
          if (_isTransient(e)) {
            _logger.warning('A support request is still waiting (${_errorCode(e)})');
            return dropped;
          }
          _logger.warning('Dropping an undeliverable support request (${_errorCode(e)})');
          await _localDataSource.writeDiscarded(value: true);
          dropped++;
        }
        await _remove(request.id);
      }
      return dropped;
    } finally {
      _isFlushing = false;
    }
  }

  /// Clears every saved request, for example when the account signs out.
  Future<void> clearPending() async {
    await _localDataSource.writePending(const []);
    await _localDataSource.writeDiscarded(value: false);
  }

  /// Whether a request was dropped since the last read, and resets the mark.
  Future<bool> takeDiscarded() async {
    final hadDiscarded = _localDataSource.readDiscarded();
    if (hadDiscarded) await _localDataSource.writeDiscarded(value: false);

    return hadDiscarded;
  }

  Future<void> _send(PendingSupportRequest request) => _dataSource.createSupportRequest(
    topic: request.topic.value,
    message: request.message,
    replyEmail: request.replyEmail,
    appVersion: request.appVersion,
  );

  Future<void> _enqueue(PendingSupportRequest request) async {
    final pending = _localDataSource.readPending();
    await _localDataSource.writePending([
      ...pending.where((item) => item.id != request.id),
      request,
    ]);
  }

  Future<void> _remove(String id) async {
    final remaining = _localDataSource.readPending().where((item) => item.id != id);
    await _localDataSource.writePending(remaining.toList());
  }

  bool _isOffline(Object error) => error is LocalizedException && error.l10nKey == networkErrorCode;

  bool _isTransient(Object error) =>
      error is LocalizedException &&
      (error.l10nKey == networkErrorCode || error.l10nKey == 'RATE_LIMITED');

  String _errorCode(Object error) =>
      error is LocalizedException ? error.l10nKey : error.runtimeType.toString();
}
