import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  test('clearDate drops the open date', () {
    final state = CapsulesState(opensOn: FormInput(DateTime(2026, 1, 9)));

    expect(state.copyWith(clearDate: true).opensOn.value, isNull);
  });

  test('changing the body keeps the open date', () {
    final state = CapsulesState(opensOn: FormInput(DateTime(2026, 1, 9)));

    final updated = state.copyWith(body: const FormInput('Para o futuro'));

    expect(updated.opensOn.value, DateTime(2026, 1, 9));
    expect(updated.body.value, 'Para o futuro');
  });

  test('validating the body reports the empty and too long cases', () {
    final empty = const CapsulesState().body.validate(
      CompositeValidator<String>([NonEmptyValidator()]),
    );
    final tooLong = FormInput('a' * (capsuleBodyMaxLength + 1))
        .validate(MaxLengthValidator(capsuleBodyMaxLength));

    expect(empty.error, NonEmptyValidationError.empty);
    expect(tooLong.error, MaxLengthValidationError.tooLong);
  });
}
