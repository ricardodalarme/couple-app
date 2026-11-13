import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearPhase drops the phase', () {
    const state = IntroState(phase: 'dating');

    expect(state.copyWith(clearPhase: true).phase, isNull);
  });

  test('changing the goals keeps the phase', () {
    const state = IntroState(phase: 'dating');

    final updated = state.copyWith(goals: ['reconnect']);

    expect(updated.phase, 'dating');
    expect(updated.goals, ['reconnect']);
  });
}
