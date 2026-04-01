import 'package:common_ui/common_ui.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    await pumpWidget(
      TranslationProvider(
        child: BaseApp(
          home: widget,
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
