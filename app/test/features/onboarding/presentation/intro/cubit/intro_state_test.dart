import 'package:flutter_bloc_starter/features/onboarding/presentation/intro/cubit/intro_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_goal.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearPhase drops the phase', () {
    const state = IntroState(phase: RelationshipPhase.dating);

    expect(state.copyWith(clearPhase: true).phase, isNull);
  });

  test('changing the goals keeps the phase', () {
    const state = IntroState(phase: RelationshipPhase.dating);

    final updated = state.copyWith(goals: [RelationshipGoal.reconnect]);

    expect(updated.phase, RelationshipPhase.dating);
    expect(updated.goals, [RelationshipGoal.reconnect]);
  });
}
