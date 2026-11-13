import 'package:flutter_bloc_starter/features/memories/data/models/memory.dart';
import 'package:flutter_bloc_starter/features/memories/presentation/add_memory/cubit/add_memory_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';

void main() {
  AddMemoryCubit build() {
    final cubit = AddMemoryCubit();
    addTearDown(cubit.close);

    return cubit;
  }

  test('a memory needs a title', () {
    final cubit = build();

    expect(cubit.submit(), isNull);
    expect(cubit.state.title.error, NonEmptyValidationError.empty);
  });

  test('the note must fit its limit', () {
    final cubit = build()
      ..onTitleChanged('Primeiro jantar')
      ..onBodyChanged('a' * (memoryBodyMaxLength + 1));

    expect(cubit.submit(), isNull);
    expect(cubit.state.body.error, MaxLengthValidationError.tooLong);
  });

  test('typing clears the error and submit returns the draft', () {
    final cubit = build();
    expect(cubit.submit(), isNull);
    expect(cubit.state.title.isValid, isFalse);

    cubit
      ..onTitleChanged('Primeiro jantar')
      ..onPlaceChanged('Paraty');

    expect(cubit.state.title.isValid, isTrue);
    final draft = cubit.submit();
    expect(draft?.title, 'Primeiro jantar');
    expect(draft?.place, 'Paraty');
    expect(draft?.body, '');
  });
}
