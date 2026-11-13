import 'package:flutter_bloc_starter/features/repair/presentation/quick_repair/cubit/quick_repair_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearPreset drops the preset', () {
    const state = QuickRepairState(preset: 'sorry');

    expect(state.copyWith(clearPreset: true).preset, isNull);
  });

  test('changing the text keeps the preset', () {
    const state = QuickRepairState(preset: 'sorry');

    final updated = state.copyWith(text: const FormInput('Desculpa'));

    expect(updated.preset, 'sorry');
    expect(updated.text.value, 'Desculpa');
  });

  test('validating the text reports the empty and too long cases', () {
    final empty = const QuickRepairState().text.validate(NonEmptyValidator());
    final tooLong = FormInput('a' * (repairMessageMaxLength + 1))
        .validate(MaxLengthValidator(repairMessageMaxLength));

    expect(empty.error, NonEmptyValidationError.empty);
    expect(tooLong.error, MaxLengthValidationError.tooLong);
  });
}
