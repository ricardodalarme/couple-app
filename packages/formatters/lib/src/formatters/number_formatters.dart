import 'package:intl/intl.dart';

abstract final class NumberFormatters {
  const NumberFormatters._();

  /// Formats [amount] as a decimal string using the specified [locale].
  ///
  /// **Examples:**
  /// ```
  /// NumberFormatters.decimal(0);                  // "0.00"
  /// NumberFormatters.decimal(0.00009);            // "0.01"
  /// NumberFormatters.decimal(1000, locale: 'en_US'); // "1,000.00"
  /// ```
  static String decimal(num amount, {int fractionDigits = 2, String? locale}) {
    final numberFormat = NumberFormat.decimalPattern(locale)
      ..maximumFractionDigits = fractionDigits
      ..minimumFractionDigits = fractionDigits;
    return numberFormat.format(amount);
  }

  /// Formats [value] as a percentage string.
  ///
  /// **Examples:**
  /// ```
  /// NumberFormatters.percentage(0);       // "0.00%"
  /// NumberFormatters.percentage(10.00009); // "10.01%"
  /// ```
  static String percentage(num value, {int fractionDigits = 2, String? locale}) {
    return '${decimal(value, fractionDigits: fractionDigits, locale: locale)}%';
  }
}
