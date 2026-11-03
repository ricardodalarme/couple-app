import 'package:intl/intl.dart';

abstract final class const CurrencyFormatters._() {
  /// Formats [amount] as a currency string using the specified [locale] (e.g., "R$ 1.234,56"
  /// for "pt_BR" or "$1,234.56" for "en_US") and [name] (e.g., "USD", "EUR").
  static String simple(num amount, {String? name, int decimalDigits = 2, String? locale}) =>
      NumberFormat.simpleCurrency(
        locale: locale,
        name: name,
        decimalDigits: decimalDigits,
      ).format(amount);

  /// Formats [amount] as a currency string with zero decimal places (e.g., "R$ 1.234").
  static String simpleShort(num amount, {String? name, String? locale}) =>
      NumberFormat.simpleCurrency(locale: locale, name: name, decimalDigits: 0).format(amount);

  /// Formats [amount] as a compact currency string (e.g., "$1.2M" instead of "$1,200,000").
  static String compact(num amount, {String? name, String? locale}) =>
      NumberFormat.compactSimpleCurrency(locale: locale, name: name).format(amount);
}
