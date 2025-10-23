import 'package:formatters/formatters.dart';
import 'package:test/test.dart';

void main() {
  group('CurrencyFormatters', () {
    test('simple formats with en_US by locale', () {
      expect(CurrencyFormatters.simple(1234.56, locale: 'en_US'), r'$1,234.56');
    });

    test('simpleShort formats zero decimals', () {
      expect(CurrencyFormatters.simpleShort(1234.56, locale: 'en_US'), r'$1,235');
    });

    test('compact formats compact currency', () {
      expect(CurrencyFormatters.compact(1200000, locale: 'en_US'), r'$1.2M');
    });
  });
}
