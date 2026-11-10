import 'package:flutter_bloc_starter/features/mood/data/data_sources/mutations/generated/ClearMoodNeed.graphql.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/mutations/generated/UpdateMood.graphql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the clear mutation leaves need out of the variables', () {
    final variables = VariablesMutationClearMoodNeed(
      id: 'm1',
      mood: 'happy',
      share: 'none',
      day: DateTime(2026, 11, 11),
    );

    expect(variables.toJson().containsKey('need'), isFalse);
  });

  test('the update sends the need and the server day', () {
    final variables = VariablesMutationUpdateMood(
      id: 'm1',
      mood: 'happy',
      need: 'hug',
      share: 'mood_need',
      day: DateTime(2026, 11, 11),
    );

    expect(variables.toJson()['need'], 'hug');
    expect(variables.toJson()['day'], '2026-11-11');
  });
}
