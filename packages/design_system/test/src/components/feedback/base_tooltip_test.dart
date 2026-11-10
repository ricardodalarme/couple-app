import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' show Tooltip, TooltipTriggerMode;

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('uses the ink bubble for ${variant.name}', (tester) async {
      await tester.pumpWidget(
        materialAppFor(
          const BaseTooltip(
            message: 'Notifications',
            trigger: BaseTooltipTrigger.tap,
            child: SizedBox(width: 44, height: 44),
          ),
          variant: variant,
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));

      expect(tooltip.message, 'Notifications');
      expect(tooltip.triggerMode, TooltipTriggerMode.tap);
      expect(tooltip.textStyle?.color, AppPalette.white);
      expect((tooltip.decoration as BoxDecoration?)?.color, AppPalette.neutral900);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('maps every trigger', (tester) async {
    for (final trigger in BaseTooltipTrigger.values) {
      await tester.pumpWidget(
        materialAppFor(
          BaseTooltip(
            message: 'Info',
            trigger: trigger,
            child: const SizedBox(width: 44, height: 44),
          ),
          variant: AppThemeVariant.rose,
        ),
      );

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      final expected = switch (trigger) {
        .tap => TooltipTriggerMode.tap,
        .longPress => TooltipTriggerMode.longPress,
      };

      expect(tooltip.triggerMode, expected);
    }
  });
}
