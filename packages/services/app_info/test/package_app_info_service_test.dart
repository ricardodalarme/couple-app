import 'package:app_info_service/app_info_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  test('reads the version and build number from the platform', () async {
    final service = PackageAppInfoService(
      load: () async => PackageInfo(
        appName: 'Repara',
        packageName: 'com.example.repara',
        version: '1.2.3',
        buildNumber: '7',
      ),
    );

    expect(await service.version(), '1.2.3');
    expect(await service.buildNumber(), '7');
  });

  test('loads the platform metadata once', () async {
    var loads = 0;
    final service = PackageAppInfoService(
      load: () async {
        loads++;
        return PackageInfo(
          appName: 'Repara',
          packageName: 'com.example.repara',
          version: '1.2.3',
          buildNumber: '7',
        );
      },
    );

    await service.version();
    await service.buildNumber();

    expect(loads, 1);
  });

  test('a failing platform read is null', () async {
    final service = PackageAppInfoService(load: () async => throw Exception('offline'));

    expect(await service.version(), isNull);
    expect(await service.buildNumber(), isNull);
  });
}
