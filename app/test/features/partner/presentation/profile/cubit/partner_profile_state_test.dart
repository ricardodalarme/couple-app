import 'package:flutter_bloc_starter/features/partner/presentation/profile/cubit/partner_profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearCategory drops the category', () {
    const state = PartnerProfileState(category: 'gifts');

    expect(state.copyWith(clearCategory: true).category, isNull);
  });

  test('changing the label keeps the category', () {
    const state = PartnerProfileState(category: 'gifts');

    final updated = state.copyWith(label: const FormInput('Café favorito'));

    expect(updated.category, 'gifts');
    expect(updated.label.value, 'Café favorito');
  });

  test('both fields start empty and valid', () {
    const state = PartnerProfileState();

    expect(state.label.value, '');
    expect(state.label.isValid, isTrue);
    expect(state.value.value, '');
    expect(state.value.isValid, isTrue);
  });
}
