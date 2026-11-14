import 'package:flutter_bloc_starter/features/slips/data/models/slip_work_area.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slip_kind/cubit/slip_kind_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearWorkArea drops the work area', () {
    const state = SlipKindState(workArea: SlipWorkArea.kitchen);

    expect(state.copyWith(clearWorkArea: true).workArea, isNull);
  });

  test('changing the text keeps the work area', () {
    const state = SlipKindState(workArea: SlipWorkArea.kitchen);

    final updated = state.copyWith(text: const FormInput('Mais uma'));

    expect(updated.workArea, SlipWorkArea.kitchen);
    expect(updated.text.value, 'Mais uma');
  });

  test('hasDraft is true only while there is something to lose', () {
    expect(const SlipKindState().hasDraft, isFalse);
    expect(const SlipKindState(text: FormInput('  ')).hasDraft, isFalse);
    expect(const SlipKindState(text: FormInput('Mais uma')).hasDraft, isTrue);
    expect(const SlipKindState(feeling: FormInput('Cansada')).hasDraft, isTrue);
    expect(const SlipKindState(plan: FormInput('Peço um tempo')).hasDraft, isTrue);
    expect(const SlipKindState(workArea: SlipWorkArea.kids).hasDraft, isTrue);
  });
}
