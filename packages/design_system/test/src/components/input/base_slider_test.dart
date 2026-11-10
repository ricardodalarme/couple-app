import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('sliders render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(
          inputHost(
            Column(
              children: [
                BaseSlider(value: .4, onChanged: (_) {}, startLabel: 'Less', endLabel: 'More'),
                const SizedBox(height: AppSpace.s16),
                BaseSlider(
                  value: .6,
                  divisions: 5,
                  onChanged: (_) {},
                  startLabel: 'Nothing',
                  endLabel: 'A lot',
                ),
              ],
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseSlider), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('slider snaps to marks and reacts to arrow keys', (tester) async {
    double? changed;

    await tester.pumpWidget(
      inputHost(
        StatefulBuilder(
          builder: (context, setState) {
            return BaseSlider(
              value: 0,
              divisions: 5,
              onChanged: (value) {
                changed = value;
                setState(() => changed = value);
              },
              startLabel: 'Nothing',
              endLabel: 'A lot',
            );
          },
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    final track = find.descendant(
      of: find.byType(BaseSlider),
      matching: find.byType(GestureDetector),
    );
    await tester.tapAt(tester.getCenter(track));
    await tester.pump();

    expect(changed, isNotNull);
    expect(changed, greaterThan(0));

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
