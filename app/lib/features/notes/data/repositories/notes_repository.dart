import 'dart:typed_data';

import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/notes/data/data_sources/remote/notes_data_source.dart';
import 'package:flutter_bloc_starter/features/notes/data/models/sent_message.dart';
import 'package:logger/logger.dart';
import 'package:storage_service/storage_service.dart';
import 'package:uuid/uuid.dart';

const String _bucket = 'messages';

class NotesRepository({
  required final NotesDataSource _dataSource,
  required final StorageService _storageService,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('NotesRepository');
  final Uuid _uuid = const Uuid();

  /// The messages the user sent, newest first, with a readable link for each drawing.
  Future<List<SentMessage>> getSent() async {
    try {
      final userId = _authenticationRepository.currentUserId;
      if (userId == null) return const [];

      final nodes = await _dataSource.getSent(userId);

      return await Future.wait([
        for (final node in nodes)
          () async {
            final path = node.mediaPath;
            return SentMessage(
              id: node.id,
              kind: node.kind == 'drawing' ? MessageKind.drawing : MessageKind.note,
              createdAt: node.createdAt,
              forWidget: node.forWidget,
              body: node.body,
              mediaPath: path,
              imageUrl: path == null ? null : await _signedUrl(path),
            );
          }(),
      ]);
    } catch (e, stack) {
      _logger.error('Failed to read sent messages', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> sendNote({required String body, required bool forWidget}) async {
    try {
      await _dataSource.send(kind: 'note', body: body.trim(), forWidget: forWidget);
    } catch (e, stack) {
      _logger.error('Failed to send a note', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Uploads the [png] under the user's own folder and then sends it as a drawing.
  Future<void> sendDrawing({required Uint8List png, required bool forWidget}) async {
    final userId = _authenticationRepository.currentUserId;
    if (userId == null) return;

    final path = '$userId/${_uuid.v4()}.png';
    try {
      await _storageService.upload(
        bucket: _bucket,
        path: path,
        bytes: png,
        contentType: 'image/png',
      );
      try {
        await _dataSource.send(kind: 'drawing', mediaPath: path, forWidget: forWidget);
      } catch (_) {
        await _removeQuietly(path);
        rethrow;
      }
    } catch (e, stack) {
      _logger.error('Failed to send a drawing', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Takes the message back so the partner no longer sees it, drawing file included.
  ///
  /// A row the server already removed still counts as success.
  Future<void> delete(SentMessage message) async {
    try {
      await _dataSource.delete(message.id);
      final path = message.mediaPath;
      if (path != null) await _removeQuietly(path);
    } catch (e, stack) {
      _logger.error('Failed to delete a message', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<String?> _signedUrl(String path) async {
    try {
      return await _storageService.signedUrl(bucket: _bucket, path: path);
    } catch (_) {
      return null;
    }
  }

  Future<void> _removeQuietly(String path) async {
    try {
      await _storageService.remove(bucket: _bucket, path: path);
    } catch (e, stack) {
      _logger.error('Failed to remove a drawing file', error: e, stackTrace: stack);
    }
  }
}
