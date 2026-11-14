import 'package:flutter_bloc_starter/features/_shared/data/data_sources/remote/generated/schema.graphql.dart';
import 'package:flutter_bloc_starter/features/devices/data/models/device_platform.dart';

extension EnumDevicePlatformMapper on EnumDevicePlatform {
  DevicePlatform toModel() => switch (this) {
    EnumDevicePlatform.ios => DevicePlatform.ios,
    EnumDevicePlatform.android => DevicePlatform.android,
    EnumDevicePlatform.$unknown => DevicePlatform.android,
  };
}
