import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_test/flutter_test.dart';

final class const _NonlinearScaler() extends TextScaler {
  @override
  double scale(double fontSize) => fontSize <= 20 ? fontSize * 1.5 : fontSize * 1.1;

  @override
  double get textScaleFactor => 1.2;
}

void main() {
  group('Settings', () {
    test('round trips the preference fields', () {
      final settings = const Settings.empty().copyWith(
        textScale: 1.3,
        reduceMotion: true,
        highContrast: true,
        locale: 'en',
      );

      expect(Settings.fromMap(settings.toMap()), settings);
    });

    test('maps saved without the preference fields keep their defaults', () {
      final settings = Settings.fromMap({'themeVariant': 'blue'});

      expect(settings.textScale, 1);
      expect(settings.reduceMotion, isFalse);
      expect(settings.highContrast, isFalse);
      expect(settings.locale, 'pt');
    });
  });

  group('AppTextScale', () {
    test('maps the offered factors', () {
      expect(AppTextScale.fromFactor(.9), AppTextScale.small);
      expect(AppTextScale.fromFactor(1.3), AppTextScale.extraLarge);
    });

    test('an unknown factor falls back to the medium size', () {
      expect(AppTextScale.fromFactor(1.07), AppTextScale.medium);
    });
  });

  group('AppTextScaler', () {
    test('keeps a nonlinear system curve per font size', () {
      const scaler = AppTextScaler(system: _NonlinearScaler(), appScale: 1.15);

      expect(scaler.scale(10), closeTo(17.25, .001));
      expect(scaler.scale(40), closeTo(50.6, .001));
    });

    test('the OS maximum caps the combined result at twice the size', () {
      const scaler = AppTextScaler(system: TextScaler.linear(2), appScale: 1.3);

      expect(scaler.scale(16), 32);
    });

    test('a system above the cap is never shrunk by a larger app choice', () {
      const scaler = AppTextScaler(system: TextScaler.linear(2.5), appScale: 1.3);

      expect(scaler.scale(16), 40);
    });

    test('a smaller app choice shrinks, but not below the minimum', () {
      expect(
        const AppTextScaler(system: TextScaler.noScaling, appScale: .9).scale(16),
        closeTo(14.4, .001),
      );
      expect(
        const AppTextScaler(system: TextScaler.linear(.5), appScale: .9).scale(16),
        closeTo(12.8, .001),
      );
    });
  });
}
