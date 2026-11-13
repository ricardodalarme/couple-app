/// Metadata of the running install.
abstract interface class AppInfoService() {
  /// The user-visible version, or null when the platform cannot report it.
  Future<String?> version();

  /// The build number, or null when the platform cannot report it.
  Future<String?> buildNumber();
}
