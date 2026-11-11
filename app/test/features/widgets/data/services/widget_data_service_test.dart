import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/services/widget_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, String?> memoryStore;
  late List<String?> updatedIOSKinds;
  late List<String?> updatedAndroidProviders;
  late List<String?> scheduledMidnightProviders;
  late List<String?> cancelledMidnightProviders;
  late String? configuredGroupId;
  late WidgetDataService service;

  setUp(() {
    memoryStore = <String, String?>{};
    updatedIOSKinds = <String?>[];
    updatedAndroidProviders = <String?>[];
    scheduledMidnightProviders = <String?>[];
    cancelledMidnightProviders = <String?>[];
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
      scheduleWidgetUpdatesFn: (dates, {name, androidName, qualifiedAndroidName}) async {
        if (dates.isNotEmpty) {
          scheduledMidnightProviders.add(qualifiedAndroidName);
        }
      },
      cancelScheduledWidgetUpdatesFn: ({name, androidName, qualifiedAndroidName}) async {
        cancelledMidnightProviders.add(qualifiedAndroidName);
      },
    );

    service = WidgetDataService(driver: driver);
  });

  test('writePayload configures App Group, sanitizes data, reloads families, and schedules midnight updates', () async {
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
    expect(
      scheduledMidnightProviders,
      containsAll([
        'com.ricardodalarme.flutter_bloc_starter.widgets.ReparaCoupleCounterWidgetProvider',
        'com.ricardodalarme.flutter_bloc_starter.widgets.ReparaCouplePhotosWidgetProvider',
        'com.ricardodalarme.flutter_bloc_starter.widgets.ReparaCardEncounterWidgetProvider',
      ]),
    );
  });

  test(
    'discreet mode strips personal fields, clears cached photo path, and cancels midnight alarms',
    () async {
      final discreetPayload = WidgetPayload.fake().copyWith(
        discreet: true,
        cachedPhotoPath: '/shared/home_widget/repara_widget_photo_path.jpg',
        pauseReturnAt: DateTime.now().add(const Duration(hours: 1)).toUtc().toIso8601String(),
        cardState: 'pause',
      );

      final sanitized = await service.writePayload(discreetPayload);

      expect(sanitized.discreet, isTrue);
      expect(sanitized.partnerName, isNull);
      expect(sanitized.nextDateTitle, isNull);
      expect(sanitized.nextDateOn, isNull);
      expect(sanitized.partnerNote, isNull);
      expect(sanitized.cachedPhotoPath, isNull);
      expect(sanitized.togetherSince, isNull);
      expect(sanitized.pauseReturnAt, isNull);
      expect(sanitized.cardState, 'none');
      expect(memoryStore[WidgetDataService.cachedPhotoStorageKey], isNull);
      expect(
        cancelledMidnightProviders,
        contains(
          'com.ricardodalarme.flutter_bloc_starter.widgets.ReparaCoupleCounterWidgetProvider',
        ),
      );
    },
  );

  test(
    'clearForSignOut overwrites payload with neutral signed-out state and cancels midnight alarms',
    () async {
      await service.writePayload(WidgetPayload.fake());
      cancelledMidnightProviders.clear();

      final cleared = await service.clearForSignOut(referenceNow: DateTime.utc(2026, 11, 11, 15));
      final stored = await service.readStoredPayload();

      expect(cleared.isSignedIn, isFalse);
      expect(stored, isNotNull);
      expect(stored!.isSignedIn, isFalse);
      expect(stored.partnerName, isNull);
      expect(stored.partnerNote, isNull);
      expect(stored.nextDateTitle, isNull);
      expect(stored.unopenedCards, 0);
      expect(
        cancelledMidnightProviders,
        contains(
          'com.ricardodalarme.flutter_bloc_starter.widgets.ReparaCoupleCounterWidgetProvider',
        ),
      );
    },
  );
}
