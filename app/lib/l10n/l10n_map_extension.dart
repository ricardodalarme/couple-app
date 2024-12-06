extension L10nStringExtension on Map<String, String> {
  static const String _fallbackMapKey = 'other';

  String selectOrFallback(String? key) {
    final String keyOrFallback = key ?? _fallbackMapKey;
    return this[keyOrFallback] ?? this[_fallbackMapKey] ?? '';
  }
}
