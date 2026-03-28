import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_service/src/device_info.dart';
import 'package:flutter/foundation.dart'; // Replaces dart:io

class DeviceInfoService {
  DeviceInfoService({DeviceInfoPlugin? deviceInfoPlugin})
    : _deviceInfoPlugin = deviceInfoPlugin ?? DeviceInfoPlugin();

  final DeviceInfoPlugin _deviceInfoPlugin;

  Future<DeviceInfo> getDeviceInfo() async {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        final IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        return DeviceInfo(
          deviceId: iosInfo.identifierForVendor,
          osName: iosInfo.systemName,
          osVersion: iosInfo.systemVersion,
          deviceName: iosInfo.name,
          deviceModel: iosInfo.modelName,
          manufacturer: 'Apple',
          isPhysicalDevice: iosInfo.isPhysicalDevice,
          physicalRamSize: iosInfo.physicalRamSize,
          totalDiskSize: iosInfo.totalDiskSize,
          freeDiskSize: iosInfo.freeDiskSize,
        );
      case TargetPlatform.android:
        final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
        return DeviceInfo(
          deviceId: androidInfo.id,
          osName: 'Android',
          osVersion: androidInfo.version.release,
          deviceName: androidInfo.name,
          deviceModel: androidInfo.model,
          manufacturer: androidInfo.manufacturer,
          isPhysicalDevice: androidInfo.isPhysicalDevice,
          physicalRamSize: androidInfo.physicalRamSize,
          totalDiskSize: androidInfo.totalDiskSize,
          freeDiskSize: androidInfo.freeDiskSize,
        );
      default:
        throw UnsupportedError('Unsupported platform');
    }
  }
}
