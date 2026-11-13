import 'package:flutter_bloc_starter/features/repair/presentation/quick_repair/cubit/quick_repair_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearPreset drops the preset', () {
    const state = QuickRepairState(preset: 'sorry');

    expect(state.copyWith(clearPreset: true).preset, isNull);
  });

  test('changing the text keeps the preset', () {
    const state = QuickRepairState(preset: 'sorry');

    final updated = state.copyWith(text: 'Desculpa');

    expect(updated.preset, 'sorry');
    expect(updated.text, 'Desculpa');
  });

  test('canSend needs a text inside the limit', () {
    expect(const QuickRepairState().canSend, isFalse);
    expect(const QuickRepairState(text: 'Desculpa').canSend, isTrue);

    const valid = QuickRepairState(text: 'Desculpa');
    expect(valid.copyWith(text: 'a' * (repairMessageMaxLength + 1)).canSend, isFalse);
  });
}
