import 'package:intl/intl.dart';

abstract final class DateFormatters {
  const DateFormatters._();

  /// Formats [date] as a short date string (e.g., "10/23/2025").
  static String shortDate(DateTime date, {String? locale}) => DateFormat.yMd(locale).format(date);

  /// Formats [date] as a medium-length date string (e.g., "Oct 23, 2025").
  static String mediumDate(DateTime date, {String? locale}) =>
      DateFormat.yMMMd(locale).format(date);

  /// Formats [date] as a long date string (e.g., "October 23, 2025").
  static String longDate(DateTime date, {String? locale}) => DateFormat.yMMMMd(locale).format(date);

  /// Formats the time portion of [date] (e.g., "8:09 AM").
  static String shortTime(DateTime date, {String? locale}) => DateFormat.jm(locale).format(date);

  /// Formats [date] as a short date and time string (e.g., "10/23/2025, 8:09 AM").
  static String shortDateTime(DateTime date, {String? locale}) =>
      DateFormat.yMd(locale).add_jm().format(date);

  /// Formats [date] using a custom [pattern].
  static String custom(DateTime date, String pattern, {String? locale}) =>
      DateFormat(pattern, locale).format(date);
}
