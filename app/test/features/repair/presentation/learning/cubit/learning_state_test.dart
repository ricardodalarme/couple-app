import 'package:flutter_bloc_starter/features/repair/presentation/learning/cubit/learning_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearKind drops the kind', () {
    const state = LearningState(kind: 'communication');

    expect(state.copyWith(clearKind: true).kind, isNull);
  });

  test('changing the note keeps the kind', () {
    const state = LearningState(kind: 'communication');

    final updated = state.copyWith(note: 'Ouvir mais');

    expect(updated.kind, 'communication');
    expect(updated.note, 'Ouvir mais');
  });

  test('canSave needs a kind and a note inside the limit', () {
    expect(const LearningState(note: 'Ouvir mais').canSave, isFalse);
    expect(const LearningState(kind: 'communication', note: 'Ouvir mais').canSave, isTrue);

    const valid = LearningState(kind: 'communication', note: 'Ouvir mais');
    expect(valid.copyWith(note: 'a' * (learningMaxLength + 1)).canSave, isFalse);
  });
}
