base class L10nPlaceholderException implements Exception {
  const L10nPlaceholderException({
    required this.l10nPlaceholder,
  });

  final String l10nPlaceholder;
}
