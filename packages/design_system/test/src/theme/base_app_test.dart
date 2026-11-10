import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('provides the theme body style as the default text style', (tester) async {
    await tester.pumpWidget(
      BaseApp(theme: AppTheme.light(AppThemeVariant.rose), home: const Text('Hello')),
    );

    final style = DefaultTextStyle.of(tester.element(find.text('Hello'))).style;

    expect(style.fontSize, 16);
    expect(style.color, AppPalette.neutral900);
    expect(style.decoration, isNull);
  });
}
