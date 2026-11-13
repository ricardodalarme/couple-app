import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/remote/capsules_data_source.dart';
import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class CapsulesRepository({
  required final CapsulesDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('CapsulesRepository');

  /// The capsules the person can see, soonest first; text is kept only once the day has come.
  Future<List<Capsule>> getCapsules({DateTime? now}) async {
    try {
      final moment = now ?? DateTime.now();
      final today = DateTime(moment.year, moment.month, moment.day);
      final selfId = _authenticationRepository.currentUserId;

      return [
        for (final node in await _dataSource.getCapsules())
          Capsule(
            id: node.id,
            opensOn: node.opensOn,
            isMine: node.authorId == selfId,
            isShared: node.coupleId != null,
            body: DateTime(node.opensOn.year, node.opensOn.month, node.opensOn.day).isAfter(today)
                ? null
                : node.body,
          ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read capsules', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Saves a capsule; when [isShared] the partner can read it from [opensOn] on.
  Future<void> add({
    required String id,
    required String body,
    required DateTime opensOn,
    required bool isShared,
  }) async {
    try {
      final coupleId = isShared ? await _togetherRepository.getCoupleId() : null;
      await _dataSource.add(id: id, body: body.trim(), opensOn: opensOn, coupleId: coupleId);
    } catch (e, stack) {
      _logger.error('Failed to save a capsule', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> delete(String id) async {
    try {
      await _dataSource.delete(id);
    } catch (e, stack) {
      _logger.error('Failed to delete a capsule', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
