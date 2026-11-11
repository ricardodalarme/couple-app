import 'dart:convert';

import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('savedAt is stored as UTC', () {
    final progress = GuideProgress(
      stepIndex: 1,
      answers: const ['um', ''],
      savedAt: DateTime(2026, 11, 11, 12),
      contentVersion: 'abc12345',
    );

    final json = jsonDecode(jsonEncode(progress.toJson())) as Map<String, Object?>;

    expect(json['savedAt'], progress.savedAt.toUtc().toIso8601String());
    expect('${json['savedAt']}', endsWith('Z'));
  });

  test('expiry compares the same instant across a daylight saving offset change', () {
    // 12:00 at UTC-5 and 12:00 at UTC-4 seven days later are 167 hours apart.
    final savedAt = DateTime.parse('2026-03-01T12:00:00-05:00');
    final now = DateTime.parse('2026-03-08T12:00:00-04:00');
    final progress = GuideProgress(
      stepIndex: 0,
      answers: const [],
      savedAt: savedAt,
      contentVersion: 'abc12345',
    );

    expect(progress.isExpiredAt(now), isFalse);
    expect(progress.isExpiredAt(now.add(const Duration(hours: 2))), isTrue);
  });

  test('progress without a content version is discarded', () {
    expect(
      GuideProgress.fromJson({
        'stepIndex': 0,
        'answers': <String>[],
        'savedAt': '2026-03-01T12:00:00Z',
      }),
      isNull,
    );
  });
}
