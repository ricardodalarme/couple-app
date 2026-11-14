import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_budget.dart';
import 'package:flutter_bloc_starter/features/gifts/data/models/gift_idea.dart';
import 'package:flutter_bloc_starter/features/gifts/data/repositories/gifts_repository.dart';
import 'package:uuid/uuid.dart';

part 'gifts_state.dart';

class GiftsCubit({required final GiftsRepository _giftsRepository}) extends Cubit<GiftsState> {
  this : super(const GiftsState());

  final Uuid _uuid = const Uuid();

  /// Reads the wishes the person can see and whether they have a partner.
  Future<void> load() async {
    if (state.gifts is! Success) emit(state.copyWith(gifts: const Loading()));
    try {
      final coupleId = await _giftsRepository.getCoupleId();
      final gifts = await _giftsRepository.getGiftIdeas();
      emit(state.copyWith(gifts: Success(gifts), coupleId: coupleId));
    } catch (exception) {
      if (state.gifts is Success) return;
      emit(state.copyWith(gifts: Failure.fromObject(exception)));
    }
  }

  /// Adds a wish, private unless the person chooses to share it and has a partner.
  Future<void> add({
    required String title,
    required bool isShared,
    String? note,
    GiftBudget? budget,
  }) async {
    final trimmed = title.trim();
    if (!_isValid(trimmed, note) || state.saveAction.isLoading || state.gifts is! Success) {
      return;
    }

    final previous = state.gifts;
    final coupleId = isShared ? state.coupleId : null;
    final gift = GiftIdea(
      id: _uuid.v4(),
      title: trimmed,
      note: _clean(note),
      budget: budget,
      isShared: coupleId != null,
      isMine: true,
    );
    emit(
      state.copyWith(gifts: Success([gift, ...state.currentGifts]), saveAction: const Loading()),
    );
    try {
      final saved = await _giftsRepository.addGiftWish(
        id: gift.id,
        title: gift.title,
        note: gift.note,
        budget: gift.budget,
        coupleId: coupleId,
      );
      emit(state.copyWith(gifts: Success(_replace(saved)), saveAction: const Success(null)));
    } catch (exception) {
      emit(state.copyWith(gifts: previous, saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  Future<void> edit(
    GiftIdea gift, {
    required String title,
    String? note,
    GiftBudget? budget,
  }) async {
    final trimmed = title.trim();
    if (!gift.isMine || !_isValid(trimmed, note) || state.saveAction.isLoading) return;

    final previous = state.currentGifts;
    await _change(
      previous: previous,
      next: [
        for (final item in previous)
          if (item.id == gift.id)
            item.withDetails(title: trimmed, note: _clean(note), budget: budget)
          else
            item,
      ],
      action: () async => _replace(
        await _giftsRepository.updateGiftWish(
          id: gift.id,
          title: trimmed,
          note: _clean(note),
          budget: budget,
        ),
      ),
    );
  }

  Future<void> delete(GiftIdea gift) {
    if (!gift.isMine) return Future.value();

    return _change(
      previous: state.currentGifts,
      next: [
        for (final item in state.currentGifts)
          if (item.id != gift.id) item,
      ],
      action: () async {
        await _giftsRepository.deleteGiftWish(gift.id);

        return null;
      },
    );
  }

  /// Shares or unshares a wish; sharing needs a partner.
  Future<void> setVisibility(GiftIdea gift, {required bool isShared}) async {
    if (!gift.isMine || state.saveAction.isLoading) return;
    final coupleId = isShared ? state.coupleId : null;
    if (isShared && coupleId == null) return;

    await _change(
      previous: state.currentGifts,
      next: [
        for (final item in state.currentGifts)
          if (item.id == gift.id) item.withShared(isShared: coupleId != null) else item,
      ],
      action: () async =>
          _replace(await _giftsRepository.setGiftWishVisibility(id: gift.id, coupleId: coupleId)),
    );
  }

  bool _isValid(String title, String? note) =>
      title.isNotEmpty &&
      title.length <= giftTitleMaxLength &&
      (note == null || note.trim().length <= giftNoteMaxLength);

  String? _clean(String? value) {
    final trimmed = value?.trim();

    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  Future<void> _change({
    required List<GiftIdea> previous,
    required List<GiftIdea> next,
    required Future<List<GiftIdea>?> Function() action,
  }) async {
    if (state.saveAction.isLoading) return;

    emit(state.copyWith(gifts: Success(next), saveAction: const Loading()));
    try {
      final confirmed = await action();
      emit(
        state.copyWith(
          gifts: confirmed == null ? null : Success(confirmed),
          saveAction: const Success(null),
        ),
      );
    } catch (exception) {
      emit(state.copyWith(gifts: Success(previous), saveAction: Failure.fromObject(exception)));
    }
    emit(state.copyWith(saveAction: const Initial()));
  }

  /// The wishes on screen with [saved] in place of the one it replaces.
  List<GiftIdea> _replace(GiftIdea saved) => [
    for (final item in state.currentGifts)
      if (item.id == saved.id) saved else item,
  ];
}
