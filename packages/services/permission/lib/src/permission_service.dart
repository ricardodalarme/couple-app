import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:permission_handler/permission_handler.dart' show Permission, PermissionStatus;

/// Requests and checks platform permissions and opens the app settings page.
class PermissionService() {
  /// Requests a single permission.
  Future<PermissionStatus> request(Permission permission) => permission.request();

  /// Reads the current status of a permission without prompting.
  Future<PermissionStatus> check(Permission permission) => permission.status;

  /// Opens the operating system settings page for this app.
  Future<bool> openAppSettings() => permission_handler.openAppSettings();
}
