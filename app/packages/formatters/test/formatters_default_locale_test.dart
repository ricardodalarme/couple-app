import 'package:formatters/formatters.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('Formatters.setDefaultLocale', () {
    test('sets Intl.defaultLocale and enables date symbols', () async {
      await Formatters.setDefaultLocale('en_US');
      expect(Intl.defaultLocale, 'en_US');

      final date = DateTime(2025, 10, 23, 8, 9);
      expect(DateFormatters.shortDate(date), '10/23/2025');
      expect(DateFormatters.shortTime(date), '8:09 AM');
      expect(NumberFormatters.decimal(1000), '1,000.00');
    });
  });
}
