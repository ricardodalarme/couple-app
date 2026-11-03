import 'package:intl/intl.dart';

abstract final class const NumberFormatters._() {
  /// Formats [value] as an integer string using the specified [locale]
  /// (e.g., "1,234" in en_US locale).
  static String integer(int value, {String? locale}) {
    final numberFormat = NumberFormat.decimalPattern(locale)..maximumFractionDigits = 0;
    return numberFormat.format(value);
  }

  /// Formats [amount] as a decimal string using the specified [locale]
  /// (e.g., "1,234.56" in en_US locale).
  static String decimal(num amount, {int fractionDigits = 2, String? locale}) {
    final numberFormat = NumberFormat.decimalPattern(locale)
      ..maximumFractionDigits = fractionDigits
      ..minimumFractionDigits = fractionDigits;
    return numberFormat.format(amount);
  }

  /// Formats [value] as a percentage string (e.g., "10.00%").
  static String percentage(num value, {int fractionDigits = 2, String? locale}) {
    return '${decimal(value, fractionDigits: fractionDigits, locale: locale)}%';
  }
}
