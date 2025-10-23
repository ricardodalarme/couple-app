import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract final class Formatters {
  const Formatters._();

  static Future<void> setDefaultLocale(String locale) async {
    Intl.defaultLocale = locale;
    await initializeDateFormatting(locale);
  }
}
