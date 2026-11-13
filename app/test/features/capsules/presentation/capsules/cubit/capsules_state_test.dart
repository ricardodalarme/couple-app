import 'package:flutter_bloc_starter/features/capsules/data/models/capsule.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearDate drops the open date', () {
    final state = CapsulesState(opensOn: DateTime(2026, 1, 9));

    expect(state.copyWith(clearDate: true).opensOn, isNull);
  });

  test('changing the body keeps the open date', () {
    final state = CapsulesState(opensOn: DateTime(2026, 1, 9));

    final updated = state.copyWith(body: 'Para o futuro');

    expect(updated.opensOn, DateTime(2026, 1, 9));
    expect(updated.body, 'Para o futuro');
  });

  test('canSave needs a body and a date inside the window', () {
    final today = DateTime(2026, 1, 1);
    final earliest = capsuleEarliest(today);

    expect(const CapsulesState(body: 'Oi').canSave(today), isFalse);
    expect(CapsulesState(body: 'Oi', opensOn: earliest).canSave(today), isTrue);
    expect(
      CapsulesState(body: 'Oi', opensOn: earliest.subtract(const Duration(days: 1))).canSave(today),
      isFalse,
    );
    expect(
      CapsulesState(body: 'a' * (capsuleBodyMaxLength + 1), opensOn: earliest).canSave(today),
      isFalse,
    );
  });
}
