import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/app_text_scale.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/widgets/app_preferences_media.dart';
import 'package:flutter_test/flutter_test.dart';

final class const _NonlinearScaler() extends TextScaler {
  @override
  double scale(double fontSize) => fontSize <= 20 ? fontSize * 1.5 : fontSize * 1.1;

  @override
  double get textScaleFactor => 1.2;
}

void main() {
  testWidgets('a medium app choice passes the system scaler through', (tester) async {
    const systemScaler = _NonlinearScaler();
    late MediaQueryData media;

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(textScaler: systemScaler),
        child: AppPreferencesMedia(
          settings: const Settings.empty(),
          child: Builder(
            builder: (context) {
              media = MediaQuery.of(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    expect(identical(media.textScaler, systemScaler), isTrue);
  });

  testWidgets('the app choice wraps a nonlinear scaler per font size', (tester) async {
    late MediaQueryData media;
    final settings = const Settings.empty().copyWith(
      textScale: 1.15,
      reduceMotion: true,
      highContrast: true,
    );

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(textScaler: _NonlinearScaler()),
        child: AppPreferencesMedia(
          settings: settings,
          child: Builder(
            builder: (context) {
              media = MediaQuery.of(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    expect(media.textScaler, isA<AppTextScaler>());
    expect(media.textScaler.scale(10), closeTo(17.25, .001));
    expect(media.textScaler.scale(40), closeTo(50.6, .001));
    expect(media.disableAnimations, isTrue);
    expect(media.highContrast, isTrue);
  });

  testWidgets('the system reduced motion and contrast stay on', (tester) async {
    late MediaQueryData media;

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true, highContrast: true),
        child: AppPreferencesMedia(
          settings: const Settings.empty(),
          child: Builder(
            builder: (context) {
              media = MediaQuery.of(context);
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    expect(media.disableAnimations, isTrue);
    expect(media.highContrast, isTrue);
  });
}
