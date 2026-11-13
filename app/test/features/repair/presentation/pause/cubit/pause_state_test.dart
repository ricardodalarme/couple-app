import 'package:flutter_bloc_starter/features/repair/data/models/pause_return.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/pause/cubit/pause_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearPreset drops the preset', () {
    const state = PauseState(preset: 'space');

    expect(state.copyWith(clearPreset: true).preset, isNull);
  });

  test('changing the return choice keeps the preset', () {
    const state = PauseState(preset: 'space');

    final updated = state.copyWith(returnChoice: PauseReturn.tomorrow);

    expect(updated.preset, 'space');
    expect(updated.returnChoice, PauseReturn.tomorrow);
  });

  test('canSend needs a message inside the limit', () {
    expect(const PauseState().canSend, isFalse);
    expect(const PauseState(message: 'Preciso de um tempo').canSend, isTrue);

    const valid = PauseState(message: 'Preciso de um tempo');
    expect(valid.copyWith(message: 'a' * (pauseMessageMaxLength + 1)).canSend, isFalse);
  });
}
