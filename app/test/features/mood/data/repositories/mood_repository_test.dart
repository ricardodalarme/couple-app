import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/mood/data/data_sources/mood_data_source.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/mood_share.dart';
import 'package:flutter_bloc_starter/features/mood/data/models/need_kind.dart';
import 'package:flutter_bloc_starter/features/mood/data/repositories/mood_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockMoodDataSource() extends Mock implements MoodDataSource;

void main() {
  late MoodDataSource dataSource;
  late MoodRepository repository;

  final day = DateTime(2026, 11, 11);
  MoodRecord record({String mood = 'tired', String? need = 'hug', String share = 'mood_need'}) =>
      (id: 'm1', day: day, mood: mood, need: need, share: share);
  MoodTodayRecord today({MoodRecord? mood, String? partnerName = 'Rui'}) =>
      (day: day, partnerName: partnerName, mood: mood);

  setUpAll(() {
    registerFallbackValue('');
    registerFallbackValue(DateTime(2026));
  });

  setUp(() {
    dataSource = _MockMoodDataSource();
    repository = MoodRepository(dataSource: dataSource);
    when(() => dataSource.getTodayMood()).thenAnswer((_) async => today(mood: record()));
  });

  test('maps the own mood, need, share and partner name', () async {
    final result = await repository.getTodayMood();

    expect(result.partnerName, 'Rui');
    expect(result.entry?.id, 'm1');
    expect(result.entry?.day, day);
    expect(result.entry?.mood, MoodKind.tired);
    expect(result.entry?.need, NeedKind.hug);
    expect(result.entry?.share, MoodShare.moodNeed);
  });

  test('an unknown server value stays private and moodless', () async {
    when(() => dataSource.getTodayMood()).thenAnswer(
      (_) async => today(
        mood: record(mood: 'unknown', need: 'unknown', share: 'unknown'),
      ),
    );

    final result = await repository.getTodayMood();

    expect(result.entry?.mood, isNull);
    expect(result.entry?.need, isNull);
    expect(result.entry?.share, MoodShare.none);
  });

  test('saving an existing row updates today and sends the server day', () async {
    when(
      () => dataSource.updateMood(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(mood: 'happy', share: 'mood'));

    final entry = await repository.saveMood(
      mood: MoodKind.happy,
      need: NeedKind.hug,
      share: MoodShare.mood,
    );

    expect(entry.mood, MoodKind.happy);
    expect(entry.share, MoodShare.mood);
    verify(
      () => dataSource.updateMood(id: 'm1', mood: 'happy', need: 'hug', share: 'mood', day: day),
    ).called(1);
    verifyNever(
      () => dataSource.insertMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    );
  });

  test('a midnight save re-reads the server day before updating', () async {
    when(() => dataSource.getTodayMood()).thenAnswer((_) async => today(mood: record()));
    when(
      () => dataSource.clearNeed(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(need: null, share: 'none'));

    await repository.saveMood(mood: MoodKind.sad, share: MoodShare.none);

    verify(() => dataSource.clearNeed(id: 'm1', mood: 'sad', share: 'none', day: day)).called(1);
  });

  test('clearing the need uses the explicit clear mutation', () async {
    when(
      () => dataSource.clearNeed(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(need: null, share: 'mood'));
    when(
      () => dataSource.updateMood(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(need: null, share: 'mood'));

    final entry = await repository.saveMood(mood: MoodKind.happy, share: MoodShare.mood);

    expect(entry.need, isNull);
    verify(() => dataSource.clearNeed(id: 'm1', mood: 'happy', share: 'mood', day: day)).called(1);
    verifyNever(
      () => dataSource.updateMood(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    );
  });

  test('a missing row inserts with the server local day', () async {
    when(() => dataSource.getTodayMood()).thenAnswer((_) async => today());
    when(
      () => dataSource.insertMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(mood: 'sad', need: null, share: 'none'));

    await repository.saveMood(mood: MoodKind.sad, share: MoodShare.none);

    verify(() => dataSource.insertMood(mood: 'sad', need: null, share: 'none', day: day)).called(1);
  });

  test('a unique race updates the row created by the other save', () async {
    var reads = 0;
    when(() => dataSource.getTodayMood()).thenAnswer((_) async {
      reads++;

      return reads == 1 ? today() : today(mood: record(share: 'none'));
    });
    when(
      () => dataSource.insertMood(
        mood: any(named: 'mood'),
        need: any(named: 'need'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenThrow(const LocalizedException(l10nKey: '23505'));
    when(
      () => dataSource.clearNeed(
        id: any(named: 'id'),
        mood: any(named: 'mood'),
        share: any(named: 'share'),
        day: any(named: 'day'),
      ),
    ).thenAnswer((_) async => record(mood: 'sad', need: null, share: 'none'));

    final entry = await repository.saveMood(mood: MoodKind.sad, share: MoodShare.none);

    expect(entry.mood, MoodKind.sad);
    verify(() => dataSource.insertMood(mood: 'sad', need: null, share: 'none', day: day)).called(1);
    verify(() => dataSource.clearNeed(id: 'm1', mood: 'sad', share: 'none', day: day)).called(1);
  });

  test('a read failure is rethrown', () {
    when(() => dataSource.getTodayMood())
        .thenThrow(const LocalizedException(l10nKey: networkErrorCode));

    expect(repository.getTodayMood(), throwsA(isA<LocalizedException>()));
  });
}
