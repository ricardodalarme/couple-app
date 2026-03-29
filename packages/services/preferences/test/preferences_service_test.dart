import 'package:flutter_test/flutter_test.dart';
import 'package:preferences_service/preferences_service.dart';

void main() {
  group('Preferences', () {
    group('constructor', () {
      test('defaults to internal FlutterPreferences if none is provided', () {
        expect(PreferencesServiceImpl.new, isNot(throwsA(isA<Exception>())));
      });
    });
  });
}
