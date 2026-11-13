extension L10nStringExtension on Map<String, String> {
  static const String _fallbackMapKey = 'other';

  String selectOrFallback(String? key) {
    final keyOrFallback = key ?? _fallbackMapKey;
    return this[keyOrFallback] ?? this[_fallbackMapKey] ?? '';
  }

  /// Returns null when there is no error to show; a missing key falls back to `other`.
  String? selectOrNull(String? key) {
    if (key == null) return null;
    return this[key] ?? this[_fallbackMapKey];
  }
}
