import 'package:app_info_service/src/app_info_service.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Reads the install metadata from the platform, loading it once per instance.
class PackageAppInfoService({final Future<PackageInfo> Function()? _load})
    implements AppInfoService {
  PackageInfo? _info;

  /// The user-visible version, or null when the platform cannot report it.
  @override
  Future<String?> version() async => (await _platformInfo())?.version;

  /// The build number, or null when the platform cannot report it.
  @override
  Future<String?> buildNumber() async => (await _platformInfo())?.buildNumber;

  Future<PackageInfo?> _platformInfo() async {
    try {
      return _info ??= await (_load ?? PackageInfo.fromPlatform)();
    } on Object {
      return null;
    }
  }
}
