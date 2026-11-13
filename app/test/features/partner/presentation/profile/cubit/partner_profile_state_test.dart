import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact.dart';
import 'package:flutter_bloc_starter/features/partner/presentation/profile/cubit/partner_profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearCategory drops the category', () {
    const state = PartnerProfileState(category: 'gifts');

    expect(state.copyWith(clearCategory: true).category, isNull);
  });

  test('changing the label keeps the category', () {
    const state = PartnerProfileState(category: 'gifts');

    final updated = state.copyWith(label: 'Café favorito');

    expect(updated.category, 'gifts');
    expect(updated.label, 'Café favorito');
  });

  test('canSave needs both fields inside their limits', () {
    expect(const PartnerProfileState().canSave, isFalse);

    const valid = PartnerProfileState(label: 'Café', value: 'Coado');
    expect(valid.canSave, isTrue);
    expect(valid.copyWith(label: 'a' * (partnerFactLabelMaxLength + 1)).canSave, isFalse);
    expect(valid.copyWith(value: '   ').canSave, isFalse);
  });
}
