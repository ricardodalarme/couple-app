import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearWorkArea drops the work area', () {
    const state = SlipKindState(workArea: 'home');

    expect(state.copyWith(clearWorkArea: true).workArea, isNull);
  });

  test('changing the text keeps the work area', () {
    const state = SlipKindState(workArea: 'home');

    final updated = state.copyWith(text: const FormInput('Mais uma'));

    expect(updated.workArea, 'home');
    expect(updated.text.value, 'Mais uma');
  });
}
