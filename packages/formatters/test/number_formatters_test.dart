import 'package:formatters/formatters.dart';
import 'package:test/test.dart';

void main() {
  group('NumberFormatters', () {
    test('decimal with default fraction digits', () {
      expect(NumberFormatters.decimal(0), '0.00');
      expect(NumberFormatters.decimal(0.00009), '0.00');
      expect(NumberFormatters.decimal(0.0049), '0.00');
      expect(NumberFormatters.decimal(0.0051), '0.01');
    });

    test('decimal honors fractionDigits and locale', () {
      expect(NumberFormatters.decimal(1000, locale: 'en_US'), '1,000.00');
      expect(NumberFormatters.decimal(1000, fractionDigits: 3, locale: 'en_US'), '1,000.000');
    });

    test('percentage uses decimal and adds %', () {
      expect(NumberFormatters.percentage(0), '0.00%');
      expect(NumberFormatters.percentage(10.00009), '10.00%');
      expect(NumberFormatters.percentage(10.005), '10.01%');
    });
  });
}
