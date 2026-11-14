import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';

part 'cards_list_state.dart';

class CardsListCubit({required final CardsRepository _cardsRepository})
    extends Cubit<CardsListState> {
  this : super(const CardsListState());

  /// Bumped by every first-page read so an older page request cannot overwrite it.
  int _generation = 0;

  /// Reads the first page again; the list on screen stays until the new one arrives.
  Future<void> load() async {
    final generation = ++_generation;
    if (state.cards is! Success) emit(const CardsListState());
    try {
      final page = await _cardsRepository.getHistory();
      if (generation != _generation) return;
      emit(
        state.copyWith(
          cards: Success(page.items),
          hasNext: page.hasNext,
          cursor: page.cursor,
          clearCursor: page.cursor == null,
          isLoadingMore: false,
        ),
      );
    } catch (exception) {
      if (generation != _generation) return;
      if (state.cards is Success) return;
      emit(state.copyWith(cards: Failure.fromObject(exception)));
    }
  }

  /// Appends the next page; ignored while one is loading or when there is none.
  Future<void> loadMore() async {
    final current = state.cards;
    if (current is! Success<List<CardSummary>>) return;
    if (!state.hasNext || state.isLoadingMore) return;

    final generation = _generation;
    emit(state.copyWith(isLoadingMore: true));
    try {
      final page = await _cardsRepository.getHistory(after: state.cursor);
      if (generation != _generation) return;
      final latest = state.cards;
      if (latest is! Success<List<CardSummary>>) return;
      final known = latest.value.map((card) => card.id).toSet();
      emit(
        state.copyWith(
          cards: Success([
            ...latest.value,
            ...page.items.where((card) => !known.contains(card.id)),
          ]),
          hasNext: page.hasNext,
          cursor: page.cursor,
          clearCursor: page.cursor == null,
          isLoadingMore: false,
        ),
      );
    } on Object {
      if (generation != _generation) return;
      emit(state.copyWith(isLoadingMore: false));
    }
  }
}
