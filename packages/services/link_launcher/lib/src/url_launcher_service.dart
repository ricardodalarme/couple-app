import 'package:link_launcher_service/src/link_launcher_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens links through the platform's external handler.
class const UrlLauncherService() implements LinkLauncherService {
  @override
  Future<bool> openExternal(Uri uri) => launchUrl(uri, mode: LaunchMode.externalApplication);
}
