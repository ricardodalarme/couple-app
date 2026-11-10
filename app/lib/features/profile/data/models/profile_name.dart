/// The longest display name the app accepts.
const int maxNameLength = 30;

final RegExp _emoji = RegExp(
  '[\u{1F000}-\u{1FFFF}\u{2190}-\u{21FF}\u{2300}-\u{23FF}\u{2600}-\u{27BF}\u{2B00}-\u{2BFF}'
  '\u{FE0F}\u{200D}]',
  unicode: true,
);

/// Removes emoji, trims and caps a typed name at [maxNameLength] characters.
String sanitizeDisplayName(String value) {
  final clean = value.replaceAll(_emoji, '').trim();
  final runes = clean.runes.toList();

  return runes.length <= maxNameLength
      ? clean
      : String.fromCharCodes(runes.take(maxNameLength)).trim();
}
