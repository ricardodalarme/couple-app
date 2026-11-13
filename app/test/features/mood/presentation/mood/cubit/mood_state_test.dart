import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('clearMood and clearNeed drop the selection', () {
    const state = MoodState(mood: MoodKind.happy, need: NeedKind.hug);

    final cleared = state.copyWith(clearMood: true, clearNeed: true);

    expect(cleared.mood, isNull);
    expect(cleared.need, isNull);
  });

  test('clearPartnerName drops the partner name', () {
    const state = MoodState(partnerName: 'Bia');

    expect(state.copyWith(clearPartnerName: true).partnerName, isNull);
  });

  test('changing the share keeps the mood and need', () {
    const state = MoodState(mood: MoodKind.happy, need: NeedKind.hug);

    final updated = state.copyWith(share: MoodShare.mood);

    expect(updated.mood, MoodKind.happy);
    expect(updated.need, NeedKind.hug);
  });

  test('canSave needs a mood and a need when both are shared', () {
    expect(const MoodState().canSave, isFalse);

    const moodOnly = MoodState(mood: MoodKind.happy, share: MoodShare.mood);
    expect(moodOnly.canSave, isTrue);

    const missingNeed = MoodState(mood: MoodKind.happy, share: MoodShare.moodNeed);
    expect(missingNeed.canSave, isFalse);

    const withNeed = MoodState(
      mood: MoodKind.happy,
      need: NeedKind.listen,
      share: MoodShare.moodNeed,
    );
    expect(withNeed.canSave, isTrue);
  });
}
