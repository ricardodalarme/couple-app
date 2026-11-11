import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Settings', () {
    test('round trips the preference fields', () {
      final settings = const Settings.empty().copyWith(locale: 'en');

      expect(Settings.fromMap(settings.toMap()), settings);
    });

    test('maps saved without the preference fields keep their defaults', () {
      final settings = Settings.fromMap({'themeVariant': 'blue'});

      expect(settings.locale, 'pt');
    });
  });
}
