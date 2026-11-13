import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/card_detail.dart';
import 'package:flutter_bloc_starter/features/cards/data/models/sunday_card.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/detail/cubit/card_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final card = SundayCard(id: 'card', status: 'sent', weekStart: DateTime(2026), items: const []);

  CardDetailState stateWith({required bool isMine, String? reaction}) => CardDetailState(
    card: Success(CardDetail(card: card, isMine: isMine)),
    reaction: reaction,
  );

  test('clearReaction drops the reaction', () {
    final state = stateWith(isMine: false, reaction: 'heart');

    expect(state.copyWith(clearReaction: true).reaction, isNull);
  });

  test('changing the reaction action keeps the reaction', () {
    final state = stateWith(isMine: false, reaction: 'heart');

    final updated = state.copyWith(reactionAction: const Loading());

    expect(updated.reaction, 'heart');
    expect(updated.reactionAction, const Loading());
  });

  test('isMine follows the loaded card', () {
    expect(const CardDetailState().isMine, isFalse);
    expect(stateWith(isMine: true).isMine, isTrue);
    expect(stateWith(isMine: false).isMine, isFalse);
  });
}
