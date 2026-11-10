import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device.dart';
import 'package:flutter_bloc_starter/features/devices/data/repositories/devices_repository.dart';
import 'package:flutter_bloc_starter/features/devices/presentation/devices/cubit/devices_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network/network.dart';

class _MockDevicesRepository() extends Mock implements DevicesRepository;

void main() {
  late DevicesRepository repository;

  final current = Device(
    id: 'current',
    platform: 'ios',
    label: 'iPhone',
    lastSeenAt: DateTime.utc(2026, 11, 10, 14),
    isCurrent: true,
  );
  final other = Device(
    id: 'other',
    platform: 'android',
    label: 'Pixel',
    lastSeenAt: DateTime.utc(2026, 11, 9, 8),
  );

  setUp(() {
    repository = _MockDevicesRepository();
    when(() => repository.revokeDevice(any())).thenAnswer((_) async {});
  });

  DevicesCubit build() => DevicesCubit(repository: repository);

  test('load shows the devices', () async {
    when(() => repository.getDevices()).thenAnswer((_) async => [current, other]);
    final cubit = build();

    await cubit.load();

    final devices = (cubit.state.devices as Success<List<Device>>).value;
    expect(devices, [current, other]);
  });

  test('a failed load shows a failure', () async {
    when(() => repository.getDevices()).thenAnswer((_) async => throw Exception('offline'));
    final cubit = build();

    await cubit.load();

    expect(cubit.state.devices, isA<Failure>());
  });

  test('revoking another device removes the row and confirms', () async {
    when(() => repository.getDevices()).thenAnswer((_) async => [current, other]);
    final cubit = build();
    await cubit.load();

    await cubit.revoke(other);

    final devices = (cubit.state.devices as Success<List<Device>>).value;
    expect(devices, [current]);
    expect(cubit.state.revokeAction, isA<Success<void>>());
    verify(() => repository.revokeDevice('other')).called(1);
  });

  test('the current device is never revoked', () async {
    when(() => repository.getDevices()).thenAnswer((_) async => [current, other]);
    final cubit = build();
    await cubit.load();

    await cubit.revoke(current);

    final devices = (cubit.state.devices as Success<List<Device>>).value;
    expect(devices, [current, other]);
    verifyNever(() => repository.revokeDevice(any()));
  });

  test('a failed revoke keeps the row and reports', () async {
    when(() => repository.getDevices()).thenAnswer((_) async => [current, other]);
    when(() => repository.revokeDevice('other'))
        .thenThrow(const LocalizedException(l10nKey: networkErrorCode));
    final cubit = build();
    await cubit.load();

    await cubit.revoke(other);

    final devices = (cubit.state.devices as Success<List<Device>>).value;
    expect(devices, [current, other]);
    expect(cubit.state.revokeAction, isA<Failure>());
  });
}
