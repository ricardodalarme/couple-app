import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/gifts_data_source.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class GiftsRepository({
  required final GiftsDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
  required final AuthenticationRepository _authenticationRepository,
}) {
  final Logger _logger = Logger('GiftsRepository');

  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() => _togetherRepository.getCoupleId();

  Future<List<GiftIdea>> getGiftIdeas() async {
    try {
      final coupleId = await _togetherRepository.getCoupleId();
      final selfId = _authenticationRepository.currentUserId;

      return [
        for (final node in await _dataSource.getGiftIdeas())
          if (node.authorId == selfId || (coupleId != null && node.coupleId == coupleId))
            GiftIdea(
              id: node.id,
              title: node.title,
              note: node.note,
              budget: node.budget,
              status: node.status,
              coupleId: node.coupleId == coupleId ? node.coupleId : null,
              isMine: node.authorId == selfId,
            ),
      ];
    } catch (e, stack) {
      _logger.error('Failed to read gift wishes', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> addGiftWish({
    required String id,
    required String title,
    String? note,
    String? budget,
    String? coupleId,
  }) => _run(
    'add a gift wish',
    () => _dataSource.addGiftWish(
      id: id,
      title: title.trim(),
      note: _clean(note),
      budget: budget,
      coupleId: coupleId,
    ),
  );

  Future<void> updateGiftWish({
    required String id,
    required String title,
    String? note,
    String? budget,
  }) => _run(
    'update a gift wish',
    () =>
        _dataSource.updateGiftWish(id: id, title: title.trim(), note: _clean(note), budget: budget),
  );

  Future<void> deleteGiftWish(String id) =>
      _run('delete a gift wish', () => _dataSource.deleteGiftWish(id));

  Future<void> setGiftWishVisibility({required String id, String? coupleId}) => _run(
    'change a gift wish visibility',
    () => _dataSource.setGiftWishVisibility(id: id, coupleId: coupleId),
  );

  String? _clean(String? value) {
    final trimmed = value?.trim();

    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
