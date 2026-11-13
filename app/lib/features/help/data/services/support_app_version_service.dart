import 'package:app_info_service/app_info_service.dart';

/// The version and build of this install, or null when the platform cannot say.
class SupportAppVersionService({required final AppInfoService _appInfoService}) {
  Future<String?> read() async {
    try {
      final version = await _appInfoService.version();
      if (version == null) return null;
      final buildNumber = await _appInfoService.buildNumber();

      return buildNumber == null || buildNumber.isEmpty ? version : '$version+$buildNumber';
    } on Object {
      return null;
    }
  }
}
