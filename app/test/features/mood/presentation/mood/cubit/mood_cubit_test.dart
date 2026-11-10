import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_entry.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/repositories/mood_repository.dart';
import 'package:flutter_bloc_starter/features/mood/presentation/mood/cubit/mood_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockMoodRepository() extends Mock implements MoodRepository;

void main() {
  late MoodRepository repository;

  final day = DateTime(2026, 11, 11);
  final entry = MoodEntry(
    id: 'm1',
    day: day,
    mood: MoodKind.tired,
    need: NeedKind.hug,
    share: MoodShare.moodNeed,
  );
  MoodToday today({MoodEntry? value, String? partnerName = 'Marina'}) =>
      (entry: value, partnerName: partnerName);

  setUpAll(() {
    registerFallbackValue(MoodKind.happy);
    registerFallbackValue(MoodShare.none);
    registerFallbackValue(NeedKind.hug);
  });

  setUp(() {
    repository = _MockMoodRepository();
    when(() => repository.getTodayMood()).thenAnswer((_) async => today(value: entry));
    when(
      () => repository.saveMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
      ),
    ).thenAnswer((invocation) async {
      final mood = invocation.namedArguments[#mood] as MoodKind;
      final need = invocation.namedArguments[#need] as NeedKind?;
      final share = invocation.namedArguments[#share] as MoodShare;

      return MoodEntry(id: 'm1', day: day, mood: mood, need: need, share: share);
    });
  });

  MoodCubit build() => MoodCubit(moodRepository: repository);

  test('loading starts the form from the saved row and partner name', () async {
    final cubit = build();

    await cubit.load();

    expect(cubit.state.entry, isA<Success<MoodEntry?>>());
    expect(cubit.state.mood, MoodKind.tired);
    expect(cubit.state.need, NeedKind.hug);
    expect(cubit.state.share, MoodShare.moodNeed);
    expect(cubit.state.partnerName, 'Marina');
  });

  test('a missing row starts private and shares nothing by default', () async {
    when(() => repository.getTodayMood()).thenAnswer((_) async => today());
    final cubit = build();

    await cubit.load();
    expect(cubit.state.share, MoodShare.none);
    expect(cubit.state.canSave, isFalse);

    cubit.selectMood(MoodKind.happy);
    await cubit.save();

    verify(() => repository.saveMood(mood: MoodKind.happy, need: null, share: MoodShare.none))
        .called(1);
  });

  test('saving twice keeps one row and the latest values win', () async {
    final cubit = build();
    await cubit.load();

    cubit
      ..selectMood(MoodKind.happy)
      ..selectShare(MoodShare.mood);
    await cubit.save();

    cubit.selectMood(MoodKind.playful);
    await cubit.save();

    verify(
      () => repository.saveMood(mood: MoodKind.happy, need: NeedKind.hug, share: MoodShare.mood),
    ).called(1);
    verify(
      () => repository.saveMood(mood: MoodKind.playful, need: NeedKind.hug, share: MoodShare.mood),
    ).called(1);
    expect((cubit.state.entry as Success<MoodEntry?>).value?.mood, MoodKind.playful);
  });

  test('save success re-emits the values the server actually saved', () async {
    when(
      () => repository.saveMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
      ),
    ).thenAnswer(
      (_) async =>
          MoodEntry(id: 'm1', day: day, mood: MoodKind.loving, need: null, share: MoodShare.none),
    );
    final cubit = build()
      ..selectMood(MoodKind.playful)
      ..selectShare(MoodShare.mood);

    await cubit.save();

    expect(cubit.state.mood, MoodKind.loving);
    expect(cubit.state.need, isNull);
    expect(cubit.state.share, MoodShare.none);
  });

  test('clearing the need also drops the need-only share', () async {
    final cubit = build();
    await cubit.load();

    cubit.toggleNeed(NeedKind.hug);

    expect(cubit.state.need, isNull);
    expect(cubit.state.share, MoodShare.mood);
  });

  test('the need-only share waits for a need', () async {
    when(() => repository.getTodayMood()).thenAnswer((_) async => today());
    final cubit = build();
    await cubit.load();

    cubit.selectShare(MoodShare.moodNeed);
    expect(cubit.state.share, MoodShare.none);

    cubit
      ..selectMood(MoodKind.happy)
      ..toggleNeed(NeedKind.listen)
      ..selectShare(MoodShare.moodNeed);
    expect(cubit.state.share, MoodShare.moodNeed);
  });

  test('a load failure becomes a failure resource', () async {
    when(() => repository.getTodayMood())
        .thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.entry, isA<Failure>());
  });

  test('a save failure keeps the choice and returns to idle', () async {
    when(
      () => repository.saveMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build()..selectMood(MoodKind.sad);

    await cubit.save();

    expect(cubit.state.mood, MoodKind.sad);
    expect(cubit.state.saveAction, isA<Initial>());
  });

  test('a closed cubit ignores a load that finishes later', () async {
    final pending = Completer<MoodToday>();
    when(() => repository.getTodayMood()).thenAnswer((_) => pending.future);
    final cubit = build();

    final load = cubit.load();
    await cubit.close();
    pending.complete(today(value: entry));

    await expectLater(load, completes);
  });

  test('a closed cubit ignores a save that finishes later', () async {
    final pending = Completer<MoodEntry>();
    when(
      () => repository.saveMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
      ),
    ).thenAnswer((_) => pending.future);
    final cubit = build()..selectMood(MoodKind.happy);

    final save = cubit.save();
    await cubit.close();
    pending.complete(entry);

    await expectLater(save, completes);
  });
}
