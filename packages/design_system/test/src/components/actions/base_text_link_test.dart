import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    final colors = colorsOf(variant);

    testWidgets('text link is tappable only when it is a link for ${variant.name}', (tester) async {
      setSurface(tester);
      var taps = 0;

      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: Scaffold(
            body: Column(
              children: [
                BaseTextLink(text: 'See all', onPressed: () => taps++),
                const BaseTextLink(text: 'Only you see this', isInformational: true),
              ],
            ),
          ),
        ),
      );

      expect(tester.widget<Text>(find.text('See all')).style?.fontSize, 15);
      expect(tester.widget<Text>(find.text('See all')).style?.color, colors.textSecondary);

      await tester.tap(find.text('See all'));
      expect(taps, 1);

      expect(find.byType(AppPressable), findsOneWidget);
    });
  }
}
