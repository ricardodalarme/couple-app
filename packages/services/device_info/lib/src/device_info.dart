import 'package:equatable/equatable.dart';

/// A platform-agnostic model representing the current device and app package.
class DeviceInfo extends Equatable {
  const DeviceInfo({
    required this.osName,
    required this.osVersion,
    required this.deviceName,
    required this.deviceModel,
    required this.manufacturer,
    required this.isPhysicalDevice,
    required this.physicalRamSize,
    required this.totalDiskSize,
    required this.freeDiskSize,
    this.deviceId,
  });

  /// Unique identifier (identifierForVendor on iOS, androidId on Android).
  final String? deviceId;

  /// Operating system name ('iOS' or 'Android').
  final String osName;

  /// Operating system version.
  final String osVersion;

  /// User-assigned device name (e.g., "John's iPhone").
  final String deviceName;

  /// Hardware model (e.g., "iPhone 16 Pro", "SM-G973F").
  final String deviceModel;

  /// Hardware manufacturer (e.g., "Apple", "Samsung").
  final String manufacturer;

  /// True if running on a real device, false for emulators/simulators.
  final bool isPhysicalDevice;

  /// Total physical RAM in megabytes.
  final int physicalRamSize;

  /// Total disk size in bytes.
  final int totalDiskSize;

  /// Available free disk size in bytes.
  final int freeDiskSize;

  @override
  List<Object?> get props => [
    deviceId,
    osName,
    osVersion,
    deviceName,
    deviceModel,
    manufacturer,
    isPhysicalDevice,
    physicalRamSize,
    totalDiskSize,
    freeDiskSize,
  ];
}
