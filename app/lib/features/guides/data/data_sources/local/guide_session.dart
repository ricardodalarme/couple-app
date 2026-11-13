/// The in-memory gate for sensitive topics, forgotten when the app closes.
class GuideSession() {
  String? _userId;
  bool _hasShownSensitiveGate = false;

  bool get hasShownSensitiveGate => _hasShownSensitiveGate;

  /// Aligns the session with [userId], forgetting the gate when the person changes.
  void syncUser(String? userId) {
    if (_userId == userId) return;
    _userId = userId;
    _hasShownSensitiveGate = false;
  }

  void markSensitiveGateShown() => _hasShownSensitiveGate = true;
}
