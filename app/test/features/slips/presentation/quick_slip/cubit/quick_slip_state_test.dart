import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearCategory drops the category', () {
    const state = QuickSlipState(category: 'gratitude');

    expect(state.copyWith(clearCategory: true).category, isNull);
  });

  test('changing the text keeps the category', () {
    const state = QuickSlipState(category: 'gratitude');

    final updated = state.copyWith(text: const FormInput('Obrigado'));

    expect(updated.category, 'gratitude');
    expect(updated.text.value, 'Obrigado');
  });

  test('isSaved follows the save action', () {
    expect(const QuickSlipState().isSaved, isFalse);
    expect(const QuickSlipState(saveAction: Success(SlipSaveOutcome.synced)).isSaved, isTrue);
    expect(const QuickSlipState(saveAction: Success(SlipSaveOutcome.queued)).isSaved, isTrue);
  });

  test('hasDraft is true only while there is something to lose', () {
    expect(const QuickSlipState().hasDraft, isFalse);
    expect(const QuickSlipState(text: FormInput('  ')).hasDraft, isFalse);
    expect(const QuickSlipState(text: FormInput('Fez café')).hasDraft, isTrue);
    expect(const QuickSlipState(category: 'did').hasDraft, isTrue);
  });
}
