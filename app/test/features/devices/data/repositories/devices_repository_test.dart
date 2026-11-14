import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/local/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/devices/data/data_sources/remote/devices_data_source.dart';
import 'package:flutter_bloc_starter/features/devices/data/data_sources/remote/queries/generated/MyDevices.graphql.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device_platform.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockDevicesDataSource() extends Mock implements DevicesDataSource;

class _MockDeviceMarkerStore() extends Mock implements DeviceMarkerStore;

void main() {
  late DevicesDataSource dataSource;
  late DeviceMarkerStore markerStore;
  late DevicesRepository repository;
  final newest = DateTime.utc(2026, 11, 10, 14, 30);
  final oldest = DateTime.utc(2026, 11, 9, 8);

  setUp(() {
    dataSource = _MockDevicesDataSource();
    markerStore = _MockDeviceMarkerStore();
    repository = DevicesRepository(dataSource: dataSource, markerStore: markerStore);
  });

  QueryMyDevicesdevicesCollectionedgesnode row({
    required String id,
    required EnumDevicePlatform platform,
    required DateTime lastSeenAt,
    String? label,
  }) => QueryMyDevicesdevicesCollectionedgesnode(
    id: id,
    platform: platform,
    label: label,
    lastSeenAt: lastSeenAt,
  );

  test('maps devices and marks the one matching the stored marker', () async {
    const token = 'token-12345678';
    final marker = DeviceMarkerStore.markerFor(token);
    when(() => markerStore.readMarker()).thenAnswer((_) async => marker);
    when(() => dataSource.getDevices()).thenAnswer(
      (_) async => [
        row(
          id: 'd1',
          platform: EnumDevicePlatform.ios,
          label: 'iPhone 14#$marker',
          lastSeenAt: newest,
        ),
        row(id: 'd2', platform: EnumDevicePlatform.android, lastSeenAt: oldest),
      ],
    );

    final devices = await repository.getDevices();

    expect(devices, hasLength(2));
    expect(devices.first.id, 'd1');
    expect(devices.first.platform, DevicePlatform.ios);
    expect(devices.first.label, 'iPhone 14');
    expect(devices.first.lastSeenAt, newest);
    expect(devices.first.isCurrent, isTrue);
    expect(devices.last.isCurrent, isFalse);
    expect(devices.last.label, isNull);
  });

  test('without a stored marker no device is marked current', () async {
    when(() => markerStore.readMarker()).thenAnswer((_) async => null);
    when(() => dataSource.getDevices()).thenAnswer(
      (_) async => [
        row(
          id: 'd1',
          platform: EnumDevicePlatform.ios,
          label: 'iPhone#${DeviceMarkerStore.markerFor('token-12345678')}',
          lastSeenAt: newest,
        ),
      ],
    );

    final devices = await repository.getDevices();

    expect(devices.single.isCurrent, isFalse);
  });

  test('an unexpected failure becomes a localized unknown error', () {
    when(() => markerStore.readMarker()).thenAnswer((_) async => null);
    when(() => dataSource.getDevices()).thenThrow(Exception('boom'));

    expect(repository.getDevices(), throwsA(isA<UnknownException>()));
  });

  test('revoke forwards the device id', () async {
    when(() => dataSource.revokeDevice('d2')).thenAnswer((_) async => true);

    await repository.revokeDevice('d2');

    verify(() => dataSource.revokeDevice('d2')).called(1);
  });

  test('revoke reports a false result as a calm failure', () {
    when(() => dataSource.revokeDevice('d2')).thenAnswer((_) async => false);

    expect(
      repository.revokeDevice('d2'),
      throwsA(
        isA<LocalizedException>().having(
          (error) => error.l10nKey,
          'l10nKey',
          deviceRevokeFailedCode,
        ),
      ),
    );
  });

  test('revoke keeps a localized failure as is', () {
    when(() => dataSource.revokeDevice('d2'))
        .thenThrow(const LocalizedException(l10nKey: networkErrorCode));

    expect(
      repository.revokeDevice('d2'),
      throwsA(
        isA<LocalizedException>().having((error) => error.l10nKey, 'l10nKey', networkErrorCode),
      ),
    );
  });
}
