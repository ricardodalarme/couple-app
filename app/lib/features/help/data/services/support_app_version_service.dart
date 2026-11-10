import 'package:package_info_plus/package_info_plus.dart';

/// The version and build of this install, or null when the platform cannot say.
class SupportAppVersionService() {
  Future<String?> read() async {
    try {
      final info = await PackageInfo.fromPlatform();

      return info.buildNumber.isEmpty ? info.version : '${info.version}+${info.buildNumber}';
    } on Object {
      return null;
    }
  }
}
