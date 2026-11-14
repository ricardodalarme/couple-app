import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/devices/data/mappers/device_platform_mapper.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device_platform.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps each platform', () {
    expect(EnumDevicePlatform.ios.toModel(), DevicePlatform.ios);
    expect(EnumDevicePlatform.android.toModel(), DevicePlatform.android);
  });

  test('an unknown platform is shown as android', () {
    expect(EnumDevicePlatform.$unknown.toModel(), DevicePlatform.android);
  });
}
