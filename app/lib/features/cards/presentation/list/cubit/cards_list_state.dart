part of 'cards_list_cubit.dart';

final class const CardsListState({
  final Resource<List<CardSummary>> cards = const Loading(),
  final bool hasNext = false,
  final String? cursor,
  final bool isLoadingMore = false,
}) with Equatable {
  CardsListState copyWith({
    Resource<List<CardSummary>>? cards,
    bool? hasNext,
    String? cursor,
    bool clearCursor = false,
    bool? isLoadingMore,
  }) => CardsListState(
    cards: cards ?? this.cards,
    hasNext: hasNext ?? this.hasNext,
    cursor: clearCursor ? null : cursor ?? this.cursor,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );

  @override
  List<Object?> get props => [cards, hasNext, cursor, isLoadingMore];
}
