base class LocalizedException implements Exception {
  const LocalizedException({required this.l10nKey});

  final String l10nKey;
}
