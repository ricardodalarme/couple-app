import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('round button keeps the 40pt visual and 44pt target for ${variant.name}', (
      tester,
    ) async {
      setSurface(tester);
      var taps = 0;

      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: Scaffold(
            body: Center(
              child: BaseRoundButton(
                icon: AppIcons.chevron_left,
                onPressed: () => taps++,
                semanticLabel: 'Back',
              ),
            ),
          ),
        ),
      );

      final box = tester.getSize(
        find.descendant(of: find.byType(BaseRoundButton), matching: find.byType(DecoratedBox)),
      );
      expect(box.width, 40);
      expect(box.height, 40);
      expect(tester.getSize(find.byType(BaseRoundButton)).width, AppIconSize.touch);
      expect(tester.widget<AppIcon>(find.byType(AppIcon)).size, 20);
      expect(tester.widget<AppPressable>(find.byType(AppPressable)).enforceMinTapTarget, isTrue);

      await tester.tap(find.byType(BaseRoundButton));
      expect(taps, 1);
    });
  }
}
