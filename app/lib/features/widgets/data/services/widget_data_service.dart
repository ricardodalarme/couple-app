import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:home_widget_service/home_widget_service.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/// Native family descriptor pairing the iOS WidgetKit `kind` with the Android provider class.
typedef NativeWidgetFamilyTarget = ({
  WidgetFamilyKind family,
  String iOSKind,
  String? androidProviderName,
  String? qualifiedAndroidProviderName,
  bool refreshesAtMidnight,
});

/// Low-level driver over the native widget store so tests can verify writes without channels.
class WidgetStoreDriver({
  final HomeWidgetService _homeWidgetService = const PlatformHomeWidgetService(),
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
  final Future<String?> Function()? appGroupPathFn,
  final Future<Directory> Function()? applicationSupportDirectoryFn,
}) {
  static const MethodChannel _widgetsChannel = MethodChannel('repara/widgets');

  static Future<String?> _defaultAppGroupPath() async {
    if (!Platform.isIOS) return null;
    try {
      return await _widgetsChannel.invokeMethod<String>('getAppGroupPath');
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  Future<String?> getAppGroupPath() => (appGroupPathFn ?? _defaultAppGroupPath)();

  Future<Directory> getApplicationSupportDirectory() =>
      (applicationSupportDirectoryFn ?? path_provider.getApplicationSupportDirectory)();

  Future<bool?> setAppGroupId(String groupId) async {
    final provided = setAppGroupIdFn;
    if (provided != null) return provided(groupId);
    await _homeWidgetService.setAppGroupId(groupId);

    return true;
  }

  Future<bool?> saveString(String id, String? data) async {
    final provided = saveStringFn;
    if (provided != null) return provided(id, data);
    await _homeWidgetService.saveString(id, data);

    return true;
  }

  Future<String?> getString(String id) =>
      getStringFn?.call(id) ?? _homeWidgetService.readString(id);

  Future<bool?> updateWidget({
    String? iOSName,
    String? androidName,
    String? qualifiedAndroidName,
  }) async {
    final provided = updateWidgetFn;
    if (provided != null) {
      return provided(
        iOSName: iOSName,
        androidName: androidName,
        qualifiedAndroidName: qualifiedAndroidName,
      );
    }
    await _homeWidgetService.updateWidget(
      iosName: iOSName,
      androidName: androidName,
      qualifiedAndroidName: qualifiedAndroidName,
    );

    return true;
  }

  Future<void> scheduleWidgetUpdates(
    List<DateTime> dates, {
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) async {
    final provided = scheduleWidgetUpdatesFn;
    if (provided != null) {
      await provided(
        dates,
        name: name,
        androidName: androidName,
        qualifiedAndroidName: qualifiedAndroidName,
      );

      return;
    }
    await _homeWidgetService.scheduleUpdates(
      dates,
      name: name,
      androidName: androidName,
      qualifiedAndroidName: qualifiedAndroidName,
    );
  }

  Future<void> cancelScheduledWidgetUpdates({
    String? name,
    String? androidName,
    String? qualifiedAndroidName,
  }) async {
    final provided = cancelScheduledWidgetUpdatesFn;
    if (provided != null) {
      await provided(
        name: name,
        androidName: androidName,
        qualifiedAndroidName: qualifiedAndroidName,
      );

      return;
    }
    await _homeWidgetService.cancelScheduledUpdates(
      name: name,
      androidName: androidName,
      qualifiedAndroidName: qualifiedAndroidName,
    );
  }

  Future<Uri?> initiallyLaunchedFromHomeWidget() =>
      initiallyLaunchedUriFn?.call() ?? _homeWidgetService.initiallyLaunched();

  Stream<Uri?> get widgetClicked => widgetClickedStream ?? _homeWidgetService.clicked;
}

/// Bridges Dart state to the iOS App Group and Android SharedPreferences widget stores.
///
/// Never logs widget payloads or personal names.
class WidgetDataService({WidgetStoreDriver? driver}) {
  static const String appGroupId = 'group.com.ricardodalarme.flutterBlocStarter';
  static const String payloadStorageKey = 'repara_widget_payload';
  static const String cachedPhotoStorageKey = 'repara_widget_photo_path';
  static const String cachedPhotoUpdatedAtKey = 'repara_widget_photo_updated_at';
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
      await clearCouplePhoto();
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
      await clearCouplePhoto();
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
    await _clearCachedPhotoReference();
  }

  /// Reads the `updated_at` marker of the cached photo, if one was stored.
  Future<String?> readCachedPhotoUpdatedAt() async {
    await initialize();
    try {
      final value = await _store.getString(cachedPhotoUpdatedAtKey);
      return value == null || value.isEmpty ? null : value;
    } on Object {
      return null;
    }
  }

  /// Writes [bytes] to a widget-accessible folder and stores the path in the shared store.
  ///
  /// On iOS the folder is the App Group container; on Android it is app-private storage.
  /// Returns null when the folder or the shared store is unavailable.
  Future<String?> cacheCouplePhoto(Uint8List bytes, String extension, {DateTime? updatedAt}) async {
    await initialize();
    if (bytes.isEmpty || extension.isEmpty) return null;
    try {
      final directory = await _photoDirectory();
      if (directory == null) return null;

      final file = File('${directory.path}/repara_widget_photo.$extension');
      final previous = await _store.getString(cachedPhotoStorageKey);
      if (previous != null && previous.isNotEmpty && previous != file.path) {
        final old = File(previous);
        if (old.existsSync()) await old.delete();
      }

      await file.writeAsBytes(bytes, flush: true);
      await _store.saveString(cachedPhotoStorageKey, file.path);
      await _store.saveString(cachedPhotoUpdatedAtKey, updatedAt?.toUtc().toIso8601String());
      return file.path;
    } on Object {
      return null;
    }
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
    final now = (referenceNow ?? clock.now()).toLocal();
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

  Future<Directory?> _photoDirectory() async {
    final appGroup = await _store.getAppGroupPath();
    if (Platform.isIOS && (appGroup == null || appGroup.isEmpty)) {
      // The widget extension cannot read Application Support, so a path there is useless.
      return null;
    }
    final base = appGroup != null && appGroup.isNotEmpty
        ? Directory(appGroup)
        : await _store.getApplicationSupportDirectory();
    final directory = Directory('${base.path}/repara_widget_photo');
    if (!directory.existsSync()) await directory.create(recursive: true);
    return directory;
  }

  Future<void> _clearCachedPhotoReference() async {
    try {
      await _store.saveString(cachedPhotoStorageKey, null);
      await _store.saveString(cachedPhotoUpdatedAtKey, null);
    } on PlatformException {
      // Ignore platform errors.
    } on MissingPluginException {
      // Ignore missing plugin in tests.
    }
  }
}
