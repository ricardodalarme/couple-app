import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_service/device_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDeviceInfoPlugin() extends Mock implements DeviceInfoPlugin;

class _MockIosDeviceInfo() extends Mock implements IosDeviceInfo;

class _MockAndroidDeviceInfo() extends Mock implements AndroidDeviceInfo;

class _MockAndroidBuildVersion() extends Mock implements AndroidBuildVersion;

void main() {
  group(DeviceInfoService, () {
    late DeviceInfoService service;
    late DeviceInfoPlugin mockPlugin;

    setUp(() {
      mockPlugin = _MockDeviceInfoPlugin();
      service = DeviceInfoService(deviceInfoPlugin: mockPlugin);
    });

    tearDown(() {
      debugDefaultTargetPlatformOverride = null;
    });

    test('parses iOS device info correctly', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      final mockIos = _MockIosDeviceInfo();
      when(() => mockIos.identifierForVendor).thenReturn('ios-123');
      when(() => mockIos.systemName).thenReturn('iOS');
      when(() => mockIos.systemVersion).thenReturn('17.4');
      when(() => mockIos.name).thenReturn("Ricardo's iPhone");
      when(() => mockIos.modelName).thenReturn('iPhone 15 Pro');
      when(() => mockIos.isPhysicalDevice).thenReturn(true);
      when(() => mockIos.physicalRamSize).thenReturn(8192);
      when(() => mockIos.totalDiskSize).thenReturn(256000000);
      when(() => mockIos.freeDiskSize).thenReturn(128000000);

      when(() => mockPlugin.iosInfo).thenAnswer((_) async => mockIos);

      final result = await service.getDeviceInfo();

      expect(result.deviceId, 'ios-123');
      expect(result.manufacturer, 'Apple');
      expect(result.osName, 'iOS');
      verify(() => mockPlugin.iosInfo).called(1);
    });

    test('parses Android device info correctly', () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      final mockAndroid = _MockAndroidDeviceInfo();
      final mockVersion = _MockAndroidBuildVersion();

      when(() => mockVersion.release).thenReturn('14');
      when(() => mockAndroid.id).thenReturn('android-456');
      when(() => mockAndroid.version).thenReturn(mockVersion);
      when(() => mockAndroid.name).thenReturn('Pixel 8');
      when(() => mockAndroid.model).thenReturn('Pixel 8 Pro');
      when(() => mockAndroid.manufacturer).thenReturn('Google');
      when(() => mockAndroid.isPhysicalDevice).thenReturn(true);
      when(() => mockAndroid.physicalRamSize).thenReturn(12288);
      when(() => mockAndroid.totalDiskSize).thenReturn(256000000);
      when(() => mockAndroid.freeDiskSize).thenReturn(128000000);

      when(() => mockPlugin.androidInfo).thenAnswer((_) async => mockAndroid);

      final result = await service.getDeviceInfo();

      expect(result.deviceId, 'android-456');
      expect(result.manufacturer, 'Google');
      expect(result.osVersion, '14');
      verify(() => mockPlugin.androidInfo).called(1);
    });

    test('throws UnsupportedError on unsupported platforms', () {
      debugDefaultTargetPlatformOverride = TargetPlatform.windows;

      expect(() => service.getDeviceInfo(), throwsA(isA<UnsupportedError>()));
    });
  });
}
