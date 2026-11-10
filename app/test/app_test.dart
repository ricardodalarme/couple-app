import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/presentation/preferences/widgets/app_preferences_media.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('the app installs the scaled media query and high-contrast theme', (tester) async {
    final settings = const Settings.empty().copyWith(
      textScale: 1.3,
      reduceMotion: true,
      highContrast: true,
    );
    late MediaQueryData media;
    late AppColors colors;

    await tester.pumpWidget(
      BaseApp(
        theme: AppTheme.light(AppThemeVariant.rose, highContrast: settings.highContrast),
        builder: (context, child) =>
            AppPreferencesMedia(settings: settings, child: child ?? const SizedBox.shrink()),
        home: Builder(
          builder: (context) {
            media = MediaQuery.of(context);
            colors = context.colors;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(media.textScaler.scale(100), closeTo(130, .01));
    expect(media.disableAnimations, isTrue);
    expect(media.highContrast, isTrue);
    expect(colors.borderDefault, AppPalette.neutral700);
    expect(colors.textSecondary, AppPalette.neutral800);
  });
}
