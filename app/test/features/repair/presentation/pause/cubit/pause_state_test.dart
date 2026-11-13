import 'package:flutter_bloc_starter/features/repair/data/models/pause_return.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/pause/cubit/pause_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

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

  test('validating the message reports the empty and too long cases', () {
    final empty = const PauseState().message.validate(NonEmptyValidator());
    final tooLong = FormInput('a' * (pauseMessageMaxLength + 1))
        .validate(MaxLengthValidator(pauseMessageMaxLength));

    expect(empty.error, NonEmptyValidationError.empty);
    expect(tooLong.error, MaxLengthValidationError.tooLong);
  });
}
