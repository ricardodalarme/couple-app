import 'package:flutter_bloc_starter/features/programs/presentation/diary/cubit/diary_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearMood and clearEditing drop their fields', () {
    const state = DiaryState(mood: 'happy', editingId: 'entry-1');

    final cleared = state.copyWith(clearMood: true, clearEditing: true);

    expect(cleared.mood, isNull);
    expect(cleared.editingId, isNull);
  });

  test('changing the body keeps the mood and editing id', () {
    const state = DiaryState(mood: 'happy', editingId: 'entry-1');

    final updated = state.copyWith(body: const FormInput('Hoje foi bom'));

    expect(updated.mood, 'happy');
    expect(updated.editingId, 'entry-1');
    expect(updated.body.value, 'Hoje foi bom');
  });
}
