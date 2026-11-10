import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_summary.dart';
import 'package:flutter_bloc_starter/features/cards/data/repositories/cards_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';

part 'cards_list_state.dart';

class CardsListCubit({
  required final CardsRepository _cardsRepository,
  required final ProfileRepository _profileRepository,
}) extends Cubit<CardsListState> {
  this : super(const CardsListState());

  String? _selfId;

  /// Reads the first page again; the list on screen stays until the new one arrives.
  Future<void> load() async {
    if (state.cards is! Success) emit(const CardsListState());
    try {
      final selfId = _selfId ??= (await _profileRepository.getMyProfile()).id;
      final page = await _cardsRepository.getHistory(selfId: selfId);
      emit(CardsListState(cards: Success(page.items), hasNext: page.hasNext, cursor: page.cursor));
    } catch (exception) {
      if (state.cards is Success) return;
      emit(CardsListState(cards: Failure.fromObject(exception)));
    }
  }

  /// Appends the next page; ignored while one is loading or when there is none.
  Future<void> loadMore() async {
    final current = state.cards;
    final selfId = _selfId;
    if (current is! Success<List<CardSummary>> || selfId == null) return;
    if (!state.hasNext || state.isLoadingMore) return;

    emit(
      CardsListState(
        cards: current,
        hasNext: state.hasNext,
        cursor: state.cursor,
        isLoadingMore: true,
      ),
    );
    try {
      final page = await _cardsRepository.getHistory(selfId: selfId, after: state.cursor);
      final known = current.value.map((card) => card.id).toSet();
      emit(
        CardsListState(
          cards: Success([
            ...current.value,
            ...page.items.where((card) => !known.contains(card.id)),
          ]),
          hasNext: page.hasNext,
          cursor: page.cursor,
        ),
      );
    } on Object {
      emit(CardsListState(cards: current, hasNext: state.hasNext, cursor: state.cursor));
    }
  }
}
