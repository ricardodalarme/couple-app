import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:home_widget/home_widget.dart';

/// Native family descriptor pairing the iOS WidgetKit `kind` with the Android provider class.
typedef NativeWidgetFamilyTarget = ({
  WidgetFamilyKind family,
  String iOSKind,
  String? androidProviderName,
  String? qualifiedAndroidProviderName,
  bool refreshesAtMidnight,
});

/// Low-level driver over `home_widget` so tests can verify shared-store writes without channels.
class WidgetStoreDriver({
  final Future<bool?> Function(String groupId)? setAppGroupIdFn,
  final Future<bool?> Function(String id, String? data)? saveStringFn,
  final Future<String?> Function(String id)? getStringFn,
  final Future<bool?> Function({
    String? iOSName,
    String? androidName,
    String? qualifiedAndroidName,
  })?
  updateWidgetFn,
  final Future<void> Function(
    List<DateTime> dates, {
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  })?
  scheduleWidgetUpdatesFn,
  final Future<void> Function({String? name, String? androidName, String? qualifiedAndroidName})?
  cancelScheduledWidgetUpdatesFn,
  final Future<Uri?> Function()? initiallyLaunchedUriFn,
  final Stream<Uri?>? widgetClickedStream,
}) {
  Future<bool?> setAppGroupId(String groupId) =>
      (setAppGroupIdFn ?? HomeWidget.setAppGroupId)(groupId);

  Future<bool?> saveString(String id, String? data) =>
      (saveStringFn ?? (key, value) => HomeWidget.saveWidgetData<String>(key, value))(id, data);

  Future<String?> getString(String id) =>
      (getStringFn ?? (key) => HomeWidget.getWidgetData<String>(key))(id);

  Future<bool?> updateWidget({
    String? iOSName,
    String? androidName,
    String? qualifiedAndroidName,
  }) => (updateWidgetFn ?? HomeWidget.updateWidget)(
    iOSName: iOSName,
    androidName: androidName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  Future<void> scheduleWidgetUpdates(
    List<DateTime> dates, {
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) => (scheduleWidgetUpdatesFn ?? HomeWidget.scheduleWidgetUpdates)(
    dates,
    name: name,
    androidName: androidName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  Future<void> cancelScheduledWidgetUpdates({
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) => (cancelScheduledWidgetUpdatesFn ?? HomeWidget.cancelScheduledWidgetUpdates)(
    name: name,
    androidName: androidName,
    qualifiedAndroidName: qualifiedAndroidName,
  );

  Future<Uri?> initiallyLaunchedFromHomeWidget() =>
      (initiallyLaunchedUriFn ?? HomeWidget.initiallyLaunchedFromHomeWidget)();

  Stream<Uri?> get widgetClicked => widgetClickedStream ?? HomeWidget.widgetClicked;
}

/// Bridges Dart state to the iOS App Group and Android SharedPreferences widget stores.
///
/// Never logs widget payloads or personal names.
class WidgetDataService({WidgetStoreDriver? driver}) {
  static const String appGroupId = 'group.com.ricardodalarme.flutterBlocStarter';
  static const String payloadStorageKey = 'repara_widget_payload';
  static const String cachedPhotoStorageKey = 'repara_widget_photo_path';
  static const String _androidPackage = 'com.ricardodalarme.flutter_bloc_starter';

  static const List<NativeWidgetFamilyTarget> familyTargets = [
    (
      family: WidgetFamilyKind.ownSmall,
      iOSKind: 'ReparaOwnSmallWidget',
      androidProviderName: 'widgets.ReparaOwnSmallWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaOwnSmallWidgetProvider',
      refreshesAtMidnight: false,
    ),
    (
      family: WidgetFamilyKind.ownMedium,
      iOSKind: 'ReparaOwnMediumWidget',
      androidProviderName: 'widgets.ReparaOwnMediumWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaOwnMediumWidgetProvider',
      refreshesAtMidnight: false,
    ),
    (
      family: WidgetFamilyKind.lockScreen,
      iOSKind: 'ReparaLockScreenWidget',
      androidProviderName: null,
      qualifiedAndroidProviderName: null,
      refreshesAtMidnight: false,
    ),
    (
      family: WidgetFamilyKind.coupleCounter,
      iOSKind: 'ReparaCoupleCounterWidget',
      androidProviderName: 'widgets.ReparaCoupleCounterWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaCoupleCounterWidgetProvider',
      refreshesAtMidnight: true,
    ),
    (
      family: WidgetFamilyKind.couplePhotos,
      iOSKind: 'ReparaCouplePhotosWidget',
      androidProviderName: 'widgets.ReparaCouplePhotosWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaCouplePhotosWidgetProvider',
      refreshesAtMidnight: true,
    ),
    (
      family: WidgetFamilyKind.partnerNote,
      iOSKind: 'ReparaPartnerNoteWidget',
      androidProviderName: 'widgets.ReparaPartnerNoteWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaPartnerNoteWidgetProvider',
      refreshesAtMidnight: false,
    ),
    (
      family: WidgetFamilyKind.cardEncounter,
      iOSKind: 'ReparaCardEncounterWidget',
      androidProviderName: 'widgets.ReparaCardEncounterWidgetProvider',
      qualifiedAndroidProviderName: '$_androidPackage.widgets.ReparaCardEncounterWidgetProvider',
      refreshesAtMidnight: true,
    ),
  ];

  final WidgetStoreDriver _store = driver ?? WidgetStoreDriver();
  bool _initialized = false;

  /// Stream of deep-link URIs triggered when the user taps a native widget.
  Stream<Uri?> get widgetClicked => _store.widgetClicked;

  /// Returns the URI that launched the app from a native widget, if any.
  Future<Uri?> initiallyLaunchedFromHomeWidget() async {
    try {
      return await _store.initiallyLaunchedFromHomeWidget();
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  /// Configures the shared App Group on iOS before reading or writing widget data.
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;
    try {
      await _store.setAppGroupId(appGroupId);
    } on PlatformException {
      // Non-iOS platforms ignore the App Group configuration.
    } on MissingPluginException {
      // Widget tests without native plugins ignore the App Group configuration.
    }
  }

  /// Sanitizes and writes a single compact JSON payload to the shared native store,
  /// schedules or cancels midnight rollover alarms, and reloads all widget families.
  Future<WidgetPayload> writePayload(WidgetPayload payload, {DateTime? referenceNow}) async {
    await initialize();
    final sanitized = payload.sanitized(referenceNow: referenceNow);

    if (sanitized.discreet || !sanitized.isSignedIn || !sanitized.isPaired || !sanitized.hasPlus) {
      await _clearCachedPhotoPathOnly();
    }

    try {
      await _store.saveString(payloadStorageKey, sanitized.toJsonString());
    } on PlatformException {
      // Shared store unavailable on this host; keep in-memory sanitized state.
    } on MissingPluginException {
      // Unit/widget test environment without native channel registration.
    }

    await updateAllFamilies();
    if (sanitized.isSignedIn && !sanitized.discreet) {
      await scheduleMidnightRollover(referenceNow: referenceNow);
    } else {
      await cancelMidnightRollover();
    }
    return sanitized;
  }

  /// Reads the last payload stored in the native shared store, if available.
  Future<WidgetPayload?> readStoredPayload() async {
    await initialize();
    try {
      final raw = await _store.getString(payloadStorageKey);
      if (raw == null || raw.isEmpty) return null;
      return WidgetPayload.fromJsonString(raw);
    } on Object {
      return null;
    }
  }

  /// Overwrites the shared store with a neutral signed-out payload and deletes cached media.
  Future<WidgetPayload> clearForSignOut({DateTime? referenceNow}) async {
    await initialize();
    await clearCouplePhoto();
    await cancelMidnightRollover();
    final neutral = WidgetPayload.signedOut(now: referenceNow);
    try {
      await _store.saveString(payloadStorageKey, neutral.toJsonString());
    } on PlatformException {
      // Ignore platform errors during sign-out cleanup.
    } on MissingPluginException {
      // Ignore missing plugin in test environments.
    }
    await updateAllFamilies();
    return neutral;
  }

  /// Reads the local cached couple photo path, returning `null` in discreet mode or without Plus.
  Future<String?> readCachedPhotoPath({required bool discreet, required bool hasPlus}) async {
    await initialize();
    if (discreet || !hasPlus) {
      await _clearCachedPhotoPathOnly();
      return null;
    }
    try {
      final path = await _store.getString(cachedPhotoStorageKey);
      if (path == null || path.isEmpty) return null;
      final file = File(path);
      if (!file.existsSync()) return null;
      return path;
    } on Object {
      return null;
    }
  }

  /// Removes any locally cached couple photo file and clears its shared-store reference.
  Future<void> clearCouplePhoto() async {
    await initialize();
    try {
      final existingPath = await _store.getString(cachedPhotoStorageKey);
      if (existingPath != null && existingPath.isNotEmpty) {
        final file = File(existingPath);
        if (file.existsSync()) {
          await file.delete();
        }
      }
    } on Object {
      // Best-effort file cleanup.
    }
    await _clearCachedPhotoPathOnly();
  }

  /// Requests an immediate timeline reload for every registered widget family.
  Future<void> updateAllFamilies() async {
    await initialize();
    for (final target in familyTargets) {
      try {
        await _store.updateWidget(
          iOSName: target.iOSKind,
          androidName: target.androidProviderName,
          qualifiedAndroidName: target.qualifiedAndroidProviderName,
        );
      } on PlatformException {
        // Family not supported on the current OS (e.g. lock screen on Android).
      } on MissingPluginException {
        // Test environment without native channel registration.
      }
    }
  }

  /// Schedules a widget refresh at the next local midnight for date-sensitive families.
  ///
  /// On iOS this is a no-op because WidgetKit timelines already schedule `.after(nextMidnight)`;
  /// on Android it arms `HomeWidgetScheduledUpdateReceiver` via `AlarmManager`.
  Future<void> scheduleMidnightRollover({DateTime? referenceNow}) async {
    await initialize();
    final now = (referenceNow ?? DateTime.now()).toLocal();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    for (final target in familyTargets.where((t) => t.refreshesAtMidnight)) {
      if (target.qualifiedAndroidProviderName == null) continue;
      try {
        await _store.scheduleWidgetUpdates(
          [nextMidnight],
          name: target.androidProviderName,
          androidName: target.androidProviderName,
          qualifiedAndroidName: target.qualifiedAndroidProviderName,
        );
      } on PlatformException {
        // Ignore on platforms where scheduled updates are unsupported.
      } on MissingPluginException {
        // Test environment without native channel registration.
      }
    }
  }

  /// Cancels any pending midnight widget update alarms.
  Future<void> cancelMidnightRollover() async {
    await initialize();
    for (final target in familyTargets.where((t) => t.refreshesAtMidnight)) {
      if (target.qualifiedAndroidProviderName == null) continue;
      try {
        await _store.cancelScheduledWidgetUpdates(
          name: target.androidProviderName,
          androidName: target.androidProviderName,
          qualifiedAndroidName: target.qualifiedAndroidProviderName,
        );
      } on PlatformException {
        // Ignore on platforms where scheduled updates are unsupported.
      } on MissingPluginException {
        // Test environment without native channel registration.
      }
    }
  }

  Future<void> _clearCachedPhotoPathOnly() async {
    try {
      await _store.saveString(cachedPhotoStorageKey, null);
    } on PlatformException {
      // Ignore platform errors.
    } on MissingPluginException {
      // Ignore missing plugin in tests.
    }
  }
}
