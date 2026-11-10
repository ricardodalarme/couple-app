part of 'card_detail_cubit.dart';

final class const CardDetailState({
  final Resource<CardDetail> card = const Loading(),
  final String? reaction,
  final Resource<void> reactionAction = const Initial(),
}) with Equatable {
  bool get isMine => switch (card) {
    Success<CardDetail>(:final value) => value.isMine,
    _ => false,
  };

  CardDetailState copyWith({
    Resource<CardDetail>? card,
    String? reaction,
    bool clearReaction = false,
    Resource<void>? reactionAction,
  }) => CardDetailState(
    card: card ?? this.card,
    reaction: clearReaction ? null : reaction ?? this.reaction,
    reactionAction: reactionAction ?? this.reactionAction,
  );

  @override
  List<Object?> get props => [card, reaction, reactionAction];
}
