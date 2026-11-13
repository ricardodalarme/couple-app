import 'package:flutter_bloc_starter/features/cards/presentation/list/cubit/cards_list_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearCursor drops the cursor', () {
    const state = CardsListState(cursor: 'cursor-1');

    expect(state.copyWith(clearCursor: true).cursor, isNull);
  });

  test('changing the loading flag keeps the cursor', () {
    const state = CardsListState(cursor: 'cursor-1', hasNext: true);

    final updated = state.copyWith(isLoadingMore: true);

    expect(updated.cursor, 'cursor-1');
    expect(updated.isLoadingMore, isTrue);
  });
}
