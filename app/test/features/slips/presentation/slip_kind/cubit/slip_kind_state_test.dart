import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearWorkArea drops the work area', () {
    const state = SlipKindState(workArea: 'home');

    expect(state.copyWith(clearWorkArea: true).workArea, isNull);
  });

  test('changing the text keeps the work area', () {
    const state = SlipKindState(workArea: 'home');

    final updated = state.copyWith(text: 'Mais uma');

    expect(updated.workArea, 'home');
    expect(updated.text, 'Mais uma');
  });

  test('canSave for a specific slip only needs the text', () {
    expect(const SlipKindState().canSave, isFalse);
    expect(const SlipKindState(text: 'Mais uma').canSave, isTrue);
    expect(SlipKindState(text: 'a' * (slipKindMaxLength + 1)).canSave, isFalse);
  });

  test('canSave for an if-then slip needs the plan', () {
    const state = SlipKindState(kind: 'if_then', text: 'Quando eu me fechar');

    expect(state.canSave, isFalse);
    expect(state.copyWith(plan: 'Eu digo o que sinto').canSave, isTrue);
  });
}
