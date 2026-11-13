import 'package:flutter_bloc_starter/features/history/presentation/history/cubit/history_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearSelectedYear drops the selected year', () {
    const state = HistoryState(selectedYear: 2024);

    expect(state.copyWith(clearSelectedYear: true).selectedYear, isNull);
  });

  test('changing the visible year count keeps the selected year', () {
    const state = HistoryState(selectedYear: 2024);

    final updated = state.copyWith(visibleYearCount: 5);

    expect(updated.selectedYear, 2024);
    expect(updated.visibleYearCount, 5);
  });
}
