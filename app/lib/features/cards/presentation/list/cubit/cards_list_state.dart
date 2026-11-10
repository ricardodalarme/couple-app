part of 'cards_list_cubit.dart';

final class const CardsListState({
  final Resource<List<CardSummary>> cards = const Loading(),
  final bool hasNext = false,
  final String? cursor,
  final bool isLoadingMore = false,
}) with Equatable {
  @override
  List<Object?> get props => [cards, hasNext, cursor, isLoadingMore];
}
