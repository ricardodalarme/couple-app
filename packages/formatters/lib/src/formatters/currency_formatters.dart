import 'package:intl/intl.dart';

abstract final class CurrencyFormatters {
  const CurrencyFormatters._();

  /// Formats [amount] as a currency string using the specified [locale].
  ///
  /// **Examples:**
  /// ```
  /// CurrencyFormatters.simple(1234.56);                    // "R$ 1.234,56"
  /// CurrencyFormatters.simple(1234.56, locale: 'en_US');   // "$1,234.56"
  /// CurrencyFormatters.simple(1234.56, name: 'EUR');       // "€ 1.234,56"
  /// ```
  static String simple(num amount, {String? name, int decimalDigits = 2, String? locale}) =>
      NumberFormat.simpleCurrency(
        locale: locale,
        name: name,
        decimalDigits: decimalDigits,
      ).format(amount);

  /// Formats [amount] as a currency string with zero decimal places.
  ///
  /// **Examples:**
  /// ```
  /// CurrencyFormatters.simpleShort(1234.56);                 // "R$ 1.234"
  /// CurrencyFormatters.simpleShort(1234.56, locale: 'en_US'); // "$1,234"
  /// CurrencyFormatters.simpleShort(1234.56, name: 'JPY');     // "¥1,234"
  /// ```
  static String simpleShort(num amount, {String? name, String? locale}) =>
      NumberFormat.simpleCurrency(locale: locale, name: name, decimalDigits: 0).format(amount);

  /// Formats [amount] as a compact currency string (e.g., "$1.2M" instead of "$1,200,000").
  ///
  /// **Examples:**
  /// ```
  /// CurrencyFormatters.compact(1200000);                    // "R$ 1,2M"
  /// CurrencyFormatters.compact(1200000, locale: 'en_US');   // "$1.2M"
  /// CurrencyFormatters.compact(1200000, name: 'EUR');       // "€1,2M"
  /// ```
  static String compact(num amount, {String? name, String? locale}) =>
      NumberFormat.compactSimpleCurrency(locale: locale, name: name).format(amount);
}
