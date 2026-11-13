/// Remembers the guarded page a signed-out person tried to open.
class PendingRoute() {
  String? _path;

  /// Stores [path] so it can be reopened after sign-in.
  void stash(String path) {
    final trimmed = path.trim();
    if (trimmed.isEmpty) return;
    _path = trimmed.startsWith('/') ? trimmed : '/$trimmed';
  }

  /// Returns the remembered path once, clearing it.
  String? take() {
    final path = _path;
    _path = null;

    return path;
  }

  /// Forgets the remembered path.
  void clear() => _path = null;
}
