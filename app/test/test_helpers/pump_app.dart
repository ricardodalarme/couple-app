import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_bloc_starter/theme/app_theme_bridge.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart' show AppThemeVariant;

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    final theme = AppThemeBridge.light(AppThemeVariant.rose);

    await pumpWidget(
      TranslationProvider(
        child: BaseApp(
          home: widget,
          theme: theme,
          darkTheme: theme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocaleUtils.supportedLocales,
        ),
      ),
    );
  }
}
