import 'dart:async';

import 'package:core/core.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/local/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/local/notifications_local_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/data_sources/remote/notifications_data_source.dart';
import 'package:flutter_bloc_starter/features/notifications/data/repositories/notifications_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notification_service/notification_service.dart';
import 'package:permission_service/permission_service.dart';

class _MockNotificationsDataSource() extends Mock implements NotificationsDataSource;

class _MockNotificationsLocalDataSource() extends Mock implements NotificationsLocalDataSource;

class _MockNotificationService() extends Mock implements NotificationService;

class _MockPermissionService() extends Mock implements PermissionService;

class _MockDeviceInfoService() extends Mock implements DeviceInfoService;

class _MockDeviceMarkerStore() extends Mock implements DeviceMarkerStore;

void main() {
  late _MockNotificationsDataSource dataSource;
  late _MockNotificationService notificationService;
  late _MockDeviceInfoService deviceInfoService;
  late _MockDeviceMarkerStore markerStore;
  late StreamController<String> registration;
  late NotificationsRepository repository;

  setUp(() {
    dataSource = _MockNotificationsDataSource();
    notificationService = _MockNotificationService();
    deviceInfoService = _MockDeviceInfoService();
    markerStore = _MockDeviceMarkerStore();
    registration = StreamController<String>();

    repository = NotificationsRepository(
      dataSource: dataSource,
      localDataSource: _MockNotificationsLocalDataSource(),
      notificationService: notificationService,
      permissionService: _MockPermissionService(),
      deviceInfoService: deviceInfoService,
      markerStore: markerStore,
    );

    when(() => notificationService.onRegistered).thenAnswer((_) => registration.stream);
    when(() => deviceInfoService.getDeviceInfo()).thenAnswer(
      (_) async => const DeviceInfo(
        deviceId: 'device',
        osName: 'iOS',
        osVersion: '18.0',
        deviceName: 'iPhone',
        deviceModel: 'iPhone 17',
        manufacturer: 'Apple',
        isPhysicalDevice: false,
        physicalRamSize: 8192,
        totalDiskSize: 128000,
        freeDiskSize: 64000,
      ),
    );
    when(() => markerStore.writeMarker(any())).thenAnswer((_) async {});
  });

  tearDown(() => registration.close());

  test('subscribes before registering so the installation id is not missed', () async {
    var listenedBeforeRegister = false;
    when(() => notificationService.register()).thenAnswer((_) async {
      listenedBeforeRegister = registration.hasListener;
      registration.add('fid-1');
    });
    when(
      () => dataSource.registerDevice(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
        label: any(named: 'label'),
      ),
    ).thenAnswer((_) async => true);

    await repository.registerDevice();

    expect(listenedBeforeRegister, isTrue);
    verify(
      () => dataSource.registerDevice(
        token: 'fid-1',
        platform: any(named: 'platform'),
        label: any(named: 'label'),
      ),
    ).called(1);
    verify(() => markerStore.writeMarker(DeviceMarkerStore.markerFor('fid-1'))).called(1);
  });

  test('a token claimed by another account fails loudly', () async {
    when(() => notificationService.register()).thenAnswer((_) async => registration.add('fid-2'));
    when(
      () => dataSource.registerDevice(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
        label: any(named: 'label'),
      ),
    ).thenAnswer((_) async => false);

    await expectLater(repository.registerDevice(), throwsA(isA<LocalizedException>()));
  });
}
