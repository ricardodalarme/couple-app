/// Opens links in another app.
abstract interface class LinkLauncherService() {
  /// Opens [uri] externally and reports whether the platform accepted it.
  Future<bool> openExternal(Uri uri);
}
