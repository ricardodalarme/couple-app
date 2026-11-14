import 'package:flutter_bloc_starter/features/repair/data/models/guided_session.dart';
import 'package:flutter_bloc_starter/features/repair/presentation/learning/cubit/learning_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearKind drops the kind', () {
    const state = LearningState(kind: RepairLearningKind.trigger);

    expect(state.copyWith(clearKind: true).kind, isNull);
  });

  test('changing the note keeps the kind', () {
    const state = LearningState(kind: RepairLearningKind.trigger);

    final updated = state.copyWith(note: const FormInput('Ouvir mais'));

    expect(updated.kind, RepairLearningKind.trigger);
    expect(updated.note.value, 'Ouvir mais');
  });

  test('validating the note reports the empty and too long cases', () {
    final empty = const LearningState().note.validate(NonEmptyValidator());
    final tooLong = FormInput('a' * (learningMaxLength + 1))
        .validate(MaxLengthValidator(learningMaxLength));

    expect(empty.error, NonEmptyValidationError.empty);
    expect(tooLong.error, MaxLengthValidationError.tooLong);
  });
}
