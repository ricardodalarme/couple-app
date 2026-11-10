import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      TranslationProvider(
        child: AppThemeHost(
          initialVariant: AppThemeVariant.rose,
          child: Builder(
            builder: (context) {
              final theme = AppTheme.light(AppThemeScope.of(context));

              return BaseApp(
                home: widget,
                theme: theme,
                supportedLocales: AppLocaleUtils.supportedLocales,
              );
            },
          ),
        ),
      ),
    );
  }
}
