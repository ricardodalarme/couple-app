import 'package:flutter_bloc_starter/features/history/presentation/story_dates/cubit/story_dates_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearSelectedKind drops the selected kind', () {
    const state = StoryDatesState(selectedKind: 'met');

    expect(state.copyWith(clearSelectedKind: true).selectedKind, isNull);
  });

  test('changing the draft date keeps the selected kind', () {
    const state = StoryDatesState(selectedKind: 'met');

    final updated = state.copyWith(draftDate: DateTime(2026));

    expect(updated.selectedKind, 'met');
    expect(updated.draftDate, DateTime(2026));
  });
}
