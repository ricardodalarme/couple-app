import 'package:intl/intl.dart';

abstract final class DateFormatters {
  const DateFormatters._();

  /// Formats [date] as a short date string (e.g., "10/23/2025").
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23);
  /// DateFormatters.shortDate(date, locale: 'en_US');   // "10/23/2025"
  /// DateFormatters.shortDate(date, locale: 'de_DE');   // "23.10.2025"
  /// DateFormatters.shortDate(date, locale: 'pt_BR');   // "23/10/2025"
  /// ```
  static String shortDate(DateTime date, {String? locale}) => DateFormat.yMd(locale).format(date);

  /// Formats [date] as a medium-length date string (e.g., "Oct 23, 2025").
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23);
  /// DateFormatters.mediumDate(date, locale: 'en_US');   // "Oct 23, 2025"
  /// DateFormatters.mediumDate(date, locale: 'fr_FR');   // "23 oct. 2025"
  /// DateFormatters.mediumDate(date, locale: 'pt_BR');   // "23 de out. de 2025"
  /// ```
  static String mediumDate(DateTime date, {String? locale}) =>
      DateFormat.yMMMd(locale).format(date);

  /// Formats [date] as a long date string (e.g., "October 23, 2025").
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23);
  /// DateFormatters.longDate(date, locale: 'en_US');   // "October 23, 2025"
  /// DateFormatters.longDate(date, locale: 'es_ES');   // "23 de octubre de 2025"
  /// DateFormatters.longDate(date, locale: 'pt_BR');   // "23 de outubro de 2025"
  /// ```
  static String longDate(DateTime date, {String? locale}) => DateFormat.yMMMMd(locale).format(date);

  /// Formats the time portion of [date] (e.g., "8:09 AM").
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23, 8, 9);
  /// DateFormatters.shortTime(date, locale: 'en_US');   // "8:09 AM"
  /// DateFormatters.shortTime(date, locale: 'pt_BR');   // "08:09"
  ///
  /// final datePM = DateTime(2025, 10, 23, 14, 30);
  /// DateFormatters.shortTime(datePM, locale: 'en_US');  // "2:30 PM"
  /// DateFormatters.shortTime(datePM, locale: 'pt_BR');  // "14:30"
  /// ```
  static String shortTime(DateTime date, {String? locale}) => DateFormat.jm(locale).format(date);

  /// Formats [date] as a short date and time string (e.g., "10/23/2025, 8:09 AM").
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23, 8, 9);
  /// DateFormatters.shortDateTime(date, locale: 'en_US');   // "10/23/2025, 8:09 AM"
  /// DateFormatters.shortDateTime(date, locale: 'pt_BR');   // "23/10/2025 08:09"
  /// ```
  static String shortDateTime(DateTime date, {String? locale}) =>
      DateFormat.yMd(locale).add_jm().format(date);

  /// Formats [date] using a custom [pattern].
  ///
  /// **Examples:**
  /// ```
  /// final date = DateTime(2025, 10, 23, 8, 9);
  /// DateFormatters.custom(date, 'yyyy-MM-dd');         // "2025-10-23"
  /// DateFormatters.custom(date, 'EEEE, MMMM d', locale: 'en_US'); // "Thursday, October 23"
  /// DateFormatters.custom(date, 'HH:mm:ss');           // "08:09:00"
  /// ```
  static String custom(DateTime date, String pattern, {String? locale}) =>
      DateFormat(pattern, locale).format(date);
}
