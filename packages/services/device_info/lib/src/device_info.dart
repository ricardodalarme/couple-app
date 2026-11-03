import 'package:equatable/equatable.dart';

/// A platform-agnostic model representing the current device and app package.
class const DeviceInfo({
  /// Operating system name ('iOS' or 'Android').
  required final String osName,

  /// Operating system version.
  required final String osVersion,

  /// User-assigned device name (e.g., "John's iPhone").
  required final String deviceName,

  /// Hardware model (e.g., "iPhone 16 Pro", "SM-G973F").
  required final String deviceModel,

  /// Hardware manufacturer (e.g., "Apple", "Samsung").
  required final String manufacturer,

  /// True if running on a real device, false for emulators/simulators.
  required final bool isPhysicalDevice,

  /// Total physical RAM in megabytes.
  required final int physicalRamSize,

  /// Total disk size in bytes.
  required final int totalDiskSize,

  /// Available free disk size in bytes.
  required final int freeDiskSize,

  /// Unique identifier (identifierForVendor on iOS, androidId on Android).
  final String? deviceId,
}) extends Equatable {
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
