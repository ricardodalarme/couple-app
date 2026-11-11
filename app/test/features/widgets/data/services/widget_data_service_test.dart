import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, String?> memoryStore;
  late List<String?> updatedIOSKinds;
  late List<String?> updatedAndroidProviders;
  late String? configuredGroupId;
  late WidgetDataService service;

  setUp(() {
    memoryStore = <String, String?>{};
    updatedIOSKinds = <String?>[];
    updatedAndroidProviders = <String?>[];
    configuredGroupId = null;

    final driver = WidgetStoreDriver(
      setAppGroupIdFn: (groupId) async {
        configuredGroupId = groupId;
        return true;
      },
      saveStringFn: (id, data) async {
        memoryStore[id] = data;
        return true;
      },
      getStringFn: (id) async => memoryStore[id],
      updateWidgetFn: ({iOSName, androidName, qualifiedAndroidName}) async {
        updatedIOSKinds.add(iOSName);
        updatedAndroidProviders.add(qualifiedAndroidName);
        return true;
      },
    );

    service = WidgetDataService(driver: driver);
  });

  test('writePayload configures App Group, sanitizes data, and reloads all families', () async {
    final now = DateTime.utc(2026, 11, 11, 12);
    final payload = WidgetPayload.fake();

    final written = await service.writePayload(payload, referenceNow: now);
    final stored = await service.readStoredPayload();

    expect(configuredGroupId, WidgetDataService.appGroupId);
    expect(stored, isNotNull);
    expect(stored!.partnerName, 'Marina');
    expect(stored.nextDateTitle, 'Aniversário');
    expect(written.updatedAt, now.toIso8601String());
    expect(updatedIOSKinds, contains('ReparaOwnSmallWidget'));
    expect(updatedIOSKinds, contains('ReparaLockScreenWidget'));
    expect(
      updatedAndroidProviders,
      contains('com.ricardodalarme.flutter_bloc_starter.widgets.ReparaOwnSmallWidgetProvider'),
    );
  });

  test('discreet mode strips personal fields and clears cached photo path', () async {
    final tempDir = await Directory.systemTemp.createTemp('widget_test_');
    addTearDown(() async {
      if (tempDir.existsSync()) await tempDir.delete(recursive: true);
    });

    final cachedPath = await service.cacheCouplePhotoBytes(
      Uint8List.fromList([1, 2, 3, 4]),
      discreet: false,
      hasPlus: true,
      directoryOverride: tempDir,
    );
    expect(cachedPath, isNotNull);

    final discreetPayload = WidgetPayload.fake().copyWith(
      discreet: true,
      cachedPhotoPath: cachedPath,
    );

    final sanitized = await service.writePayload(discreetPayload);

    expect(sanitized.discreet, isTrue);
    expect(sanitized.partnerName, isNull);
    expect(sanitized.nextDateTitle, isNull);
    expect(sanitized.nextDateOn, isNull);
    expect(sanitized.partnerNote, isNull);
    expect(sanitized.cachedPhotoPath, isNull);
    expect(sanitized.togetherSince, isNull);
    expect(memoryStore[WidgetDataService.cachedPhotoStorageKey], isNull);
  });

  test('clearForSignOut overwrites payload with neutral signed-out state', () async {
    await service.writePayload(WidgetPayload.fake());

    final cleared = await service.clearForSignOut(referenceNow: DateTime.utc(2026, 11, 11, 15));
    final stored = await service.readStoredPayload();

    expect(cleared.isSignedIn, isFalse);
    expect(stored, isNotNull);
    expect(stored!.isSignedIn, isFalse);
    expect(stored.partnerName, isNull);
    expect(stored.partnerNote, isNull);
    expect(stored.nextDateTitle, isNull);
    expect(stored.unopenedCards, 0);
  });
}
