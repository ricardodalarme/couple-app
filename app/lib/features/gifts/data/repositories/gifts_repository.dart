import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/gifts_data_source.dart';
import 'package:flutter_bloc_starter/features/gifts/data/mappers/gift_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:logger/logger.dart';

class GiftsRepository({
  required final GiftsDataSource _dataSource,
  required final TogetherRepository _togetherRepository,
}) {
  final Logger _logger = Logger('GiftsRepository');

  /// The id of the couple the person is in, or null when they are on their own.
  Future<String?> getCoupleId() => _togetherRepository.getCoupleId();

  Future<List<GiftIdea>> getGiftIdeas() async {
    try {
      return [
        for (final node in await _dataSource.getGiftIdeas())
          if (node.isMine == true || node.isShared == true)
            GiftIdea(
              id: node.id,
              title: node.title,
              note: node.note,
              budget: node.budget?.toModel(),
              status: node.status.toModel(),
              isShared: node.isShared ?? false,
              isMine: node.isMine ?? false,
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
    GiftBudget? budget,
    String? coupleId,
  }) => _run(
    'add a gift wish',
    () => _dataSource.addGiftWish(
      id: id,
      title: title.trim(),
      note: _clean(note),
      budget: budget?.toRemote(),
      coupleId: coupleId,
    ),
  );

  Future<void> updateGiftWish({
    required String id,
    required String title,
    String? note,
    GiftBudget? budget,
  }) => _run(
    'update a gift wish',
    () => _dataSource.updateGiftWish(
      id: id,
      title: title.trim(),
      note: _clean(note),
      budget: budget?.toRemote(),
    ),
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
