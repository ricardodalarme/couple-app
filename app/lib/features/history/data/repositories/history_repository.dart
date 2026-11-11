import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/history/data/data_sources/history_data_source.dart';
import 'package:flutter_bloc_starter/features/history/data/mappers/history_mapper.dart';
import 'package:flutter_bloc_starter/features/history/data/models/history_models.dart';
import 'package:flutter_bloc_starter/features/profile/data/mappers/relationship_phase_mapper.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/relationship_phase.dart';
import 'package:logger/logger.dart';

const String notOwnerCode = 'NOT_OWNER';

class HistoryRepository({required final HistoryDataSource _dataSource}) {
  final Logger _logger = Logger('HistoryRepository');

  Future<HistoryOverview> getOverview({DateTime? now}) => _run('load history overview', () async {
    final currentNow = now ?? DateTime.now();
    final raw = await _dataSource.getOverview(year: currentNow.year);
    return raw.toModel(now: currentNow);
  });

  /// Creates or updates a milestone, supporting known dates (`day`/`month`/`year`)
  /// and unknown dates (stored in `important_dates` with `year: null`).
  Future<void> saveMilestone({
    required String id,
    required String title,
    required MilestoneKind kind,
    required MilestoneDatePrecision precision,
    required bool isShared,
    DateTime? date,
    String? place,
    String? body,
    String? coupleId,
    HistoryMilestone? existing,
  }) => _run('save milestone', () async {
    if (existing != null && !existing.isMine) {
      throw const LocalizedException(l10nKey: notOwnerCode);
    }

    final trimmedTitle = title.trim();
    final trimmedPlace = (place == null || place.trim().isEmpty) ? null : place.trim();
    final trimmedBody = (body == null || body.trim().isEmpty) ? null : body.trim();
    final targetCoupleId = isShared ? coupleId : null;
    final isUnknownDate = precision == MilestoneDatePrecision.unknown || date == null;

    if (isUnknownDate) {
      final dateKind = switch (kind) {
        .first => 'first',
        .trip => 'trip',
        .met || .dating || .engaged || .married => 'relationship',
        .home || .custom => 'custom',
      };
      if (existing != null && existing.source == MilestoneSource.importantDate) {
        await _dataSource.updateImportantDate(
          id: existing.id,
          coupleId: targetCoupleId,
          title: trimmedTitle,
          kind: dateKind,
          month: 1,
          day: 1,
          yearly: false,
        );
      } else {
        await _dataSource.insertImportantDate(
          id: id,
          coupleId: targetCoupleId,
          title: trimmedTitle,
          kind: dateKind,
          month: 1,
          day: 1,
          yearly: false,
        );
        if (existing != null) await deleteMilestone(existing);
      }
      return;
    }

    final resolvedDate = DateTime.utc(
      date.year,
      precision == MilestoneDatePrecision.year ? 1 : date.month,
      precision == MilestoneDatePrecision.day ? date.day : 1,
    );

    final hasMemoryFields =
        trimmedPlace != null ||
        trimmedBody != null ||
        kind == MilestoneKind.trip ||
        kind == MilestoneKind.first ||
        (existing?.source == MilestoneSource.memory);

    if (hasMemoryFields) {
      final origin = kind == MilestoneKind.first ? 'first' : 'manual';
      if (existing != null && existing.source == MilestoneSource.memory) {
        await _dataSource.updateMemory(
          id: existing.id,
          coupleId: targetCoupleId,
          title: trimmedTitle,
          body: trimmedBody,
          place: trimmedPlace,
          happenedOn: resolvedDate,
          datePrecision: precision.serverValue,
          origin: origin,
        );
      } else {
        await _dataSource.insertMemory(
          id: id,
          coupleId: targetCoupleId,
          title: trimmedTitle,
          body: trimmedBody,
          place: trimmedPlace,
          happenedOn: resolvedDate,
          datePrecision: precision.serverValue,
          origin: origin,
        );
        if (existing != null) await deleteMilestone(existing);
      }
      return;
    }

    final storyKind = switch (kind) {
      .met => 'met',
      .dating => 'dating',
      .engaged => 'engaged',
      .married => 'married',
      .first || .trip || .home || .custom => 'custom',
    };

    if (existing != null && existing.source == MilestoneSource.storyEvent) {
      await _dataSource.updateStoryEvent(
        id: existing.id,
        coupleId: targetCoupleId,
        kind: storyKind,
        title: trimmedTitle,
        happenedOn: resolvedDate,
        datePrecision: precision.serverValue,
      );
    } else {
      await _dataSource.insertStoryEvent(
        id: id,
        coupleId: targetCoupleId,
        kind: storyKind,
        title: trimmedTitle,
        happenedOn: resolvedDate,
        datePrecision: precision.serverValue,
      );
      if (existing != null) await deleteMilestone(existing);
    }
  });

  Future<void> deleteMilestone(HistoryMilestone milestone) => _run('delete milestone', () async {
    if (!milestone.isMine) {
      throw const LocalizedException(l10nKey: notOwnerCode);
    }
    await switch (milestone.source) {
      .storyEvent => _dataSource.deleteStoryEvent(milestone.id),
      .memory => _dataSource.deleteMemory(milestone.id),
      .importantDate => _dataSource.deleteImportantDate(milestone.id),
    };
  });

  /// Saves one of the four canonical story dates (`met`, `dating`, `engaged`, `married`)
  /// and syncs `together_since` when `dating` or `met` is updated.
  ///
  /// A canonical event owned by the partner is never updated: pass no
  /// [existingEventId] so the person's own event is created instead.
  Future<void> saveStoryDate({
    required String id,
    required String profileId,
    required String kind,
    required String title,
    required DateTime date,
    String? existingEventId,
    bool existingEventIsMine = true,
    String? coupleId,
    bool updateTogetherSince = false,
  }) => _run('save story date', () async {
    if (existingEventId != null && !existingEventIsMine) {
      throw const LocalizedException(l10nKey: notOwnerCode);
    }
    final normalized = DateTime.utc(date.year, date.month, date.day);
    if (existingEventId != null) {
      await _dataSource.updateStoryEvent(
        id: existingEventId,
        coupleId: coupleId,
        kind: kind,
        title: title,
        happenedOn: normalized,
        datePrecision: MilestoneDatePrecision.month.serverValue,
      );
    } else {
      await _dataSource.insertStoryEvent(
        id: id,
        coupleId: coupleId,
        kind: kind,
        title: title,
        happenedOn: normalized,
        datePrecision: MilestoneDatePrecision.month.serverValue,
      );
    }

    if (updateTogetherSince && profileId.isNotEmpty) {
      await _dataSource.updateTogetherSince(profileId: profileId, togetherSince: normalized);
    }
  });

  Future<void> updateTogetherSince({required String profileId, required DateTime date}) => _run(
    'update together since',
    () => _dataSource.updateTogetherSince(
      profileId: profileId,
      togetherSince: DateTime.utc(date.year, date.month, date.day),
    ),
  );

  Future<void> updateAvatarKind({required String profileId, required AvatarKind kind}) => _run(
    'update avatar kind',
    () => _dataSource.updateAvatarKind(profileId: profileId, avatarKind: kind.serverValue),
  );

  Future<void> updatePhase({required String profileId, required RelationshipPhase phase}) => _run(
    'update relationship phase',
    () => _dataSource.updatePhase(profileId: profileId, phase: phase.toSource()),
  );

  Future<T> _run<T>(String what, Future<T> Function() action) async {
    try {
      return await action();
    } catch (e, stack) {
      _logger.error('Failed to $what', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
