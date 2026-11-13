import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter_bloc_starter/features/guides/data/models/guide_progress.dart';
import 'package:preferences_service/preferences_service.dart';

/// Keeps each guide's position and answers for one signed-in person.
class GuidesLocalDataSource({required final PreferencesService _preferencesService}) {
  static const progressKeyPrefix = 'guideProgress.';
  static const anonymousOwner = 'anonymous';

  static String progressKey(String slug, {required String? ownerId}) =>
      '$progressKeyPrefix${ownerId ?? anonymousOwner}.$slug';

  /// The stored progress for [slug] and [ownerId], or null when it is missing, malformed or expired.
  Future<GuideProgress?> readProgress(
    String slug, {
    required String? ownerId,
    DateTime? now,
  }) async {
    final raw = _preferencesService.readString(key: progressKey(slug, ownerId: ownerId));
    if (raw == null) return null;

    final progress = _decode(raw);
    if (progress == null || progress.isExpiredAt(now ?? clock.now())) {
      await deleteProgress(slug, ownerId: ownerId);

      return null;
    }

    return progress;
  }

  Future<void> writeProgress(String slug, GuideProgress progress, {required String? ownerId}) =>
      _preferencesService.writeString(
        key: progressKey(slug, ownerId: ownerId),
        value: jsonEncode(progress.toJson()),
      );

  Future<void> deleteProgress(String slug, {required String? ownerId}) =>
      _preferencesService.delete(key: progressKey(slug, ownerId: ownerId));

  GuideProgress? _decode(String raw) {
    try {
      return GuideProgress.fromJson(jsonDecode(raw));
    } on FormatException {
      return null;
    }
  }
}
