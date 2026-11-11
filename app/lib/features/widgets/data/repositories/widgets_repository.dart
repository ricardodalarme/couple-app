import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/settings/data/data_sources/discreet_local_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/mutations/generated/UpdateWidgetPreferences.graphql.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/data_sources/widgets_local_data_source.dart';
import 'package:flutter_bloc_starter/features/widgets/data/mappers/widgets_mapper.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:logger/logger.dart';

/// Coordinates server widget reads, local privacy/rotation settings, and the shared native store.
///
/// Never logs widget payloads or personal names.
class WidgetsRepository({
  required final WidgetsDataSource _dataSource,
  required final WidgetsLocalDataSource _localDataSource,
  required final DiscreetLocalDataSource _discreetLocalDataSource,
  required final WidgetDataService _widgetDataService,
}) {
  final Logger _logger = Logger('WidgetsRepository');
  Future<void> _writeQueue = Future<void>.value();
  int _generation = 0;

  /// Fetches the latest widget state from the backend, persists it to the native store,
  /// and falls back to the last cached payload with `isOffline: true` when offline.
  Future<WidgetOverview> loadAndSync({DateTime? now}) async {
    final generation = _generation + 1;
    _generation = generation;
    final contentSource = _localDataSource.contentSource;
    final rotationCadence = _localDataSource.rotationCadence;

    try {
      final response = await _dataSource.getOverview();
      final localDiscreet = _discreetLocalDataSource.hideWidgetText;
      final isDiscreet = (response.widget?.discreet ?? false) || localDiscreet;
      final hasPlus = response.today?.hasPlus ?? false;
      final cachedPhotoPath = await _widgetDataService.readCachedPhotoPath(
        discreet: isDiscreet,
        hasPlus: hasPlus,
      );

      final overview = response.toModel(
        localHideWidgetText: localDiscreet,
        contentSource: contentSource,
        rotationCadence: rotationCadence,
        cachedPhotoPath: cachedPhotoPath,
        now: now,
      );

      final syncedPayload = await _enqueueWrite(() async {
        if (generation != _generation) return null;
        final written = await _widgetDataService.writePayload(overview.payload, referenceNow: now);
        await _localDataSource.writeCachedPayload(written);
        return written;
      });
      return syncedPayload == null ? overview : overview.copyWith(payload: syncedPayload);
    } catch (e, stack) {
      final cached = _localDataSource.readCachedPayload();
      if (cached != null) {
        final localDiscreet = _discreetLocalDataSource.hideWidgetText;
        final offlinePayload = cached
            .copyWith(discreet: cached.discreet || localDiscreet, isOffline: true)
            .sanitized(referenceNow: now);
        await _enqueueWrite(() async {
          if (generation != _generation) return;
          await _widgetDataService.writePayload(offlinePayload, referenceNow: now);
        });
        return WidgetOverview(
          payload: offlinePayload,
          preferences: WidgetPreferences(
            profileId: '',
            showNames: offlinePayload.showNames,
            hideInDiscreet: offlinePayload.discreet,
            allowPartnerNotes: offlinePayload.allowPartnerNotes,
            onLockScreen: offlinePayload.onLockScreen,
            contentSource: contentSource,
            rotationCadence: rotationCadence,
          ),
        );
      }
      _logger.error('Failed to load widget overview', error: e, stackTrace: stack);
      rethrow;
    }
  }

  /// Refreshes the native shared store in the background without throwing to callers.
  Future<void> syncQuietly({DateTime? now}) async {
    try {
      await loadAndSync(now: now);
    } on Object {
      // Background sync failures keep the existing cached native state.
    }
  }

  /// Updates the shared native store immediately when discreet mode changes.
  Future<WidgetPayload> applyDiscreetModeImmediately({
    required bool discreet,
    DateTime? now,
  }) async {
    final generation = _generation + 1;
    _generation = generation;
    await _discreetLocalDataSource.setHideWidgetText(value: discreet);
    return _enqueueWrite(() async {
      final existing =
          _localDataSource.readCachedPayload() ?? await _widgetDataService.readStoredPayload();
      if (existing == null || !existing.isSignedIn) {
        return _writeDiscreetFallback(discreet: discreet, generation: generation, now: now);
      }
      if (generation != _generation) {
        return _localDataSource.readCachedPayload() ?? WidgetPayload.signedOut(now: now);
      }
      final updated = existing.copyWith(discreet: discreet).sanitized(referenceNow: now);
      await _localDataSource.writeCachedPayload(updated);
      await _widgetDataService.writePayload(updated, referenceNow: now);
      if (!discreet) {
        unawaited(syncQuietly(now: now));
      }
      return updated;
    });
  }

  /// Writes a neutral signed-out payload and removes any cached personal state or photo.
  Future<WidgetPayload> clearOnSignOut({DateTime? now}) async {
    _generation++;
    await _localDataSource.clear();
    return _enqueueWrite(() => _widgetDataService.clearForSignOut(referenceNow: now));
  }

  /// Saves the user's widget privacy and rotation settings and refreshes the native store.
  Future<WidgetOverview> savePreferences(WidgetPreferences preferences, {DateTime? now}) async {
    try {
      if (preferences.profileId.isEmpty) {
        throw const LocalizedException(l10nKey: 'WIDGET_PREFERENCES_SAVE_FAILED');
      }
      await _localDataSource.setContentSource(preferences.contentSource);
      await _localDataSource.setRotationCadence(preferences.rotationCadence);
      await _discreetLocalDataSource.setHideWidgetText(value: preferences.hideInDiscreet);

      final affected = await _dataSource.updatePreferences(
        VariablesMutationUpdateWidgetPreferences(
          profileId: preferences.profileId,
          widgetShowNames: preferences.showNames,
          widgetInDiscreet: !preferences.hideInDiscreet,
          widgetAllowPartnerNotes: preferences.allowPartnerNotes,
          widgetOnLockScreen: preferences.onLockScreen,
        ),
      );
      if (affected == 0) {
        throw const LocalizedException(l10nKey: 'WIDGET_PREFERENCES_SAVE_FAILED');
      }

      return await loadAndSync(now: now);
    } catch (e, stack) {
      _logger.error('Failed to save widget preferences', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<WidgetPayload> _writeDiscreetFallback({
    required bool discreet,
    required int generation,
    DateTime? now,
  }) async {
    if (generation != _generation) {
      return _localDataSource.readCachedPayload() ?? WidgetPayload.signedOut(now: now);
    }
    final fallback = WidgetPayload(
      isSignedIn: true,
      discreet: discreet,
      isPaired: false,
      hasPlus: false,
      showNames: false,
      allowPartnerNotes: false,
      onLockScreen: false,
      isOffline: false,
      unopenedCards: 0,
      cardState: 'none',
      slipsCount: 0,
      updatedAt: (now ?? DateTime.now()).toUtc().toIso8601String(),
    ).sanitized(referenceNow: now);
    await _widgetDataService.writePayload(fallback, referenceNow: now);
    return fallback;
  }

  Future<T> _enqueueWrite<T>(Future<T> Function() task) {
    final result = Completer<T>();
    _writeQueue = _writeQueue.then((_) async {
      try {
        result.complete(await task());
      } catch (error, stackTrace) {
        result.completeError(error, stackTrace);
      }
    });
    return result.future;
  }
}
