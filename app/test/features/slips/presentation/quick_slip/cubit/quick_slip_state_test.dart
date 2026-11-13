import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearCategory drops the category', () {
    const state = QuickSlipState(category: 'gratitude');

    expect(state.copyWith(clearCategory: true).category, isNull);
  });

  test('changing the text keeps the category', () {
    const state = QuickSlipState(category: 'gratitude');

    final updated = state.copyWith(text: 'Obrigado');

    expect(updated.category, 'gratitude');
    expect(updated.text, 'Obrigado');
  });

  test('canSave needs a text inside the limit', () {
    expect(const QuickSlipState().canSave, isFalse);
    expect(const QuickSlipState(text: 'Obrigado').canSave, isTrue);
    expect(QuickSlipState(text: 'a' * (quickSlipMaxLength + 1)).canSave, isFalse);
  });

  test('isSaved follows the save action', () {
    expect(const QuickSlipState().isSaved, isFalse);
    expect(const QuickSlipState(saveAction: Success(SlipSaveOutcome.synced)).isSaved, isTrue);
    expect(const QuickSlipState(saveAction: Success(SlipSaveOutcome.queued)).isSaved, isTrue);
  });
}
