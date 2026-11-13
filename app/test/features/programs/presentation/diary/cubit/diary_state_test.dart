import 'package:flutter_bloc_starter/features/programs/data/models/diary_entry.dart';
import 'package:flutter_bloc_starter/features/programs/presentation/diary/cubit/diary_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearMood and clearEditing drop their fields', () {
    const state = DiaryState(mood: 'happy', editingId: 'entry-1');

    final cleared = state.copyWith(clearMood: true, clearEditing: true);

    expect(cleared.mood, isNull);
    expect(cleared.editingId, isNull);
  });

  test('changing the body keeps the mood and editing id', () {
    const state = DiaryState(mood: 'happy', editingId: 'entry-1');

    final updated = state.copyWith(body: 'Hoje foi bom');

    expect(updated.mood, 'happy');
    expect(updated.editingId, 'entry-1');
  });

  test('canSave needs a body inside the limit', () {
    expect(const DiaryState().canSave, isFalse);
    expect(const DiaryState(body: 'Hoje foi bom').canSave, isTrue);
    expect(DiaryState(body: 'a' * (journalBodyMaxLength + 1)).canSave, isFalse);
  });
}
