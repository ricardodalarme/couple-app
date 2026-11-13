import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/need/cubit/need_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearNeed drops the need', () {
    const state = NeedState(need: 'hug');

    expect(state.copyWith(clearNeed: true).need, isNull);
  });

  test('changing the send action keeps the need', () {
    const state = NeedState(need: 'hug');

    final updated = state.copyWith(sendAction: const Loading());

    expect(updated.need, 'hug');
    expect(updated.sendAction, const Loading());
  });
}
