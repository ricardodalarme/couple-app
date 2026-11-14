import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/_shared/data/data_sources/local/device_marker_store.dart';
import 'package:flutter_bloc_starter/features/devices/data/data_sources/remote/devices_data_source.dart';
import 'package:flutter_bloc_starter/features/devices/data/mappers/device_platform_mapper.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device.dart';
import 'package:logger/logger.dart';

/// Reported when the server deletes no device row.
const String deviceRevokeFailedCode = 'DEVICE_REVOKE_FAILED';

class DevicesRepository({
  required final DevicesDataSource _dataSource,
  required final DeviceMarkerStore _markerStore,
}) {
  final Logger _logger = Logger('DevicesRepository');

  /// Reads the devices that receive notifications; the current one is recognised by the marker.
  Future<List<Device>> getDevices() async {
    try {
      final rows = await _dataSource.getDevices();
      final marker = await _markerStore.readMarker();
      final devices = <Device>[];
      for (final row in rows) {
        final parts = _parts(row.label);
        devices.add(
          Device(
            id: row.id,
            platform: row.platform.toModel(),
            label: parts.name,
            lastSeenAt: row.lastSeenAt,
            isCurrent: marker != null && parts.markerValue == marker,
          ),
        );
      }

      return devices;
    } catch (exception, stack) {
      _logger.error('Failed to load devices', error: exception, stackTrace: stack);
      if (exception is LocalizedException) rethrow;
      throw const UnknownException();
    }
  }

  /// Stops notifications on one device; the row is gone on the next read.
  Future<void> revokeDevice(String id) async {
    try {
      if (!await _dataSource.revokeDevice(id)) {
        throw const LocalizedException(l10nKey: deviceRevokeFailedCode);
      }
    } catch (exception, stack) {
      _logger.error('Failed to revoke a device', error: exception, stackTrace: stack);
      if (exception is LocalizedException) rethrow;
      throw const UnknownException();
    }
  }

  /// Removes this installation's row when it is still present.
  Future<void> revokeCurrentDevice() async {
    try {
      final marker = await _markerStore.readMarker();
      if (marker == null) return;

      final current = (await getDevices()).where((device) => device.isCurrent).firstOrNull;
      if (current != null) await revokeDevice(current.id);
    } catch (exception, stack) {
      _logger.warning('Could not remove the current device', error: exception, stackTrace: stack);
    } finally {
      await _markerStore.clear();
    }
  }

  ({String? name, String? markerValue}) _parts(String? label) {
    final index = label?.lastIndexOf('#') ?? -1;
    if (index == -1) return (name: label, markerValue: null);

    return (name: label!.substring(0, index), markerValue: label.substring(index + 1));
  }
}
