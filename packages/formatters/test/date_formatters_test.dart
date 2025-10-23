import 'package:formatters/formatters.dart';
import 'package:test/test.dart';

void main() {
  group('DateFormatters', () {
    final date = DateTime(2025, 10, 23, 8, 9);

    test('shortDate uses yMd and locale', () {
      expect(DateFormatters.shortDate(date, locale: 'en_US'), '10/23/2025');
    });

    test('mediumDate uses yMMMd and locale', () {
      expect(DateFormatters.mediumDate(date, locale: 'en_US'), 'Oct 23, 2025');
    });

    test('longDate uses yMMMMd and locale', () {
      expect(DateFormatters.longDate(date, locale: 'en_US'), 'October 23, 2025');
    });

    test('shortTime uses jm and locale', () {
      expect(DateFormatters.shortTime(date, locale: 'en_US'), '8:09 AM');
    });

    test('shortDateTime concatenates date and time', () {
      expect(DateFormatters.shortDateTime(date, locale: 'en_US'), '10/23/2025 8:09 AM');
    });

    test('custom pattern and locale', () {
      expect(DateFormatters.custom(date, 'yyyy-MM-dd', locale: 'en_US'), '2025-10-23');
      expect(DateFormatters.custom(date, 'HH:mm:ss', locale: 'en_US'), '08:09:00');
    });
  });
}
