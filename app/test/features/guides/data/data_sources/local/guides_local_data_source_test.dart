import 'dart:convert';

import 'package:flutter_bloc_starter/features/guides/data/data_sources/local/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences_service/preferences_service.dart';

class _MockPreferencesService() extends Mock implements PreferencesService;

void main() {
  late PreferencesService preferences;
  late GuidesLocalDataSource dataSource;

  final now = DateTime.utc(2026, 11, 11, 12);
  const owner = 'user-a';

  setUp(() {
    preferences = _MockPreferencesService();
    dataSource = GuidesLocalDataSource(preferencesService: preferences);
    when(() => preferences.delete(key: any(named: 'key'))).thenAnswer((_) async {});
    when(
      () => preferences.writeString(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});
  });

  test('a saved progress is read back with its step, answers and prep id', () async {
    final progress = GuideProgress(
      stepIndex: 2,
      answers: const ['um', 'dois', 'três', ''],
      savedAt: now.subtract(const Duration(days: 2)),
      contentVersion: 'abc12345',
      prepId: 'prep-1',
    );
    when(
      () => preferences.readString(key: GuidesLocalDataSource.progressKey('money', ownerId: owner)),
    ).thenReturn(jsonEncode(progress.toJson()));

    final read = await dataSource.readProgress('money', ownerId: owner, now: now);

    expect(read, progress);
  });

  test('progress older than seven days is removed and starts fresh', () async {
    final expired = GuideProgress(
      stepIndex: 3,
      answers: const ['um', 'dois', 'três', 'quatro'],
      savedAt: now.subtract(const Duration(days: 8)),
      contentVersion: 'abc12345',
      prepId: 'prep-1',
    );
    when(
      () => preferences.readString(key: GuidesLocalDataSource.progressKey('money', ownerId: owner)),
    ).thenReturn(jsonEncode(expired.toJson()));

    final read = await dataSource.readProgress('money', ownerId: owner, now: now);

    expect(read, isNull);
    verify(
      () => preferences.delete(key: GuidesLocalDataSource.progressKey('money', ownerId: owner)),
    ).called(1);
  });

  test('progress saved exactly seven days ago is still valid', () async {
    final kept = GuideProgress(
      stepIndex: 1,
      answers: const ['um', ''],
      savedAt: now.subtract(const Duration(days: 7)),
      contentVersion: 'abc12345',
    );
    when(
      () => preferences.readString(key: GuidesLocalDataSource.progressKey('money', ownerId: owner)),
    ).thenReturn(jsonEncode(kept.toJson()));

    expect(await dataSource.readProgress('money', ownerId: owner, now: now), kept);
  });

  test('malformed progress is discarded', () async {
    when(() => preferences.readString(key: any(named: 'key'))).thenReturn('not-json');

    expect(await dataSource.readProgress('money', ownerId: owner, now: now), isNull);
    verify(
      () => preferences.delete(key: GuidesLocalDataSource.progressKey('money', ownerId: owner)),
    ).called(1);
  });

  test('two user ids do not share progress', () async {
    final progress = GuideProgress(
      stepIndex: 2,
      answers: const ['um', 'dois', 'três', ''],
      savedAt: now,
      contentVersion: 'abc12345',
    );
    when(
      () => preferences.readString(
        key: GuidesLocalDataSource.progressKey('money', ownerId: 'user-a'),
      ),
    ).thenReturn(jsonEncode(progress.toJson()));

    await dataSource.writeProgress('money', progress, ownerId: 'user-a');

    final writtenKey =
        verify(
              () => preferences.writeString(
                key: captureAny(named: 'key'),
                value: any(named: 'value'),
              ),
            ).captured.single
            as String;
    expect(writtenKey, GuidesLocalDataSource.progressKey('money', ownerId: 'user-a'));

    expect(await dataSource.readProgress('money', ownerId: 'user-a', now: now), progress);
    expect(await dataSource.readProgress('money', ownerId: 'user-b', now: now), isNull);
    expect(await dataSource.readProgress('money', ownerId: null, now: now), isNull);
  });
}
