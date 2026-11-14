import 'package:flutter_bloc_starter/features/gifts/data/data_sources/remote/gifts_data_source.dart';
import 'package:flutter_bloc_starter/features/gifts/data/mappers/gift_enum_mapper.dart';
import 'package:flutter_bloc_starter/features/gifts/data/mappers/gift_mapper.dart';
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

  Future<List<GiftIdea>> getGiftIdeas() => _run(
    'read gift wishes',
    () async => [
      for (final node in await _dataSource.getGiftIdeas())
        if (node.isMine == true || node.isShared == true) node.toModel(),
    ],
  );

  /// Adds the wish and returns it as the server stored it.
  Future<GiftIdea> addGiftWish({
    required String id,
    required String title,
    String? note,
    GiftBudget? budget,
    String? coupleId,
  }) => _run(
    'add a gift wish',
    () async => (await _dataSource.addGiftWish(
      id: id,
      title: title.trim(),
      note: _clean(note),
      budget: budget?.toRemote(),
      coupleId: coupleId,
    )).toModel(),
  );

  Future<GiftIdea> updateGiftWish({
    required String id,
    required String title,
    String? note,
    GiftBudget? budget,
  }) => _run(
    'update a gift wish',
    () async => (await _dataSource.updateGiftWish(
      id: id,
      title: title.trim(),
      note: _clean(note),
      budget: budget?.toRemote(),
    )).toModel(),
  );

  Future<void> deleteGiftWish(String id) =>
      _run('delete a gift wish', () => _dataSource.deleteGiftWish(id));

  Future<GiftIdea> setGiftWishVisibility({required String id, String? coupleId}) => _run(
    'change a gift wish visibility',
    () async => (await _dataSource.setGiftWishVisibility(id: id, coupleId: coupleId)).toModel(),
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
