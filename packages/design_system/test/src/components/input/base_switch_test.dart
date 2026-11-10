import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('switches render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(
          inputHost(
            Row(
              children: [
                BaseSwitch(value: true, onChanged: (_) {}),
                const SizedBox(width: AppSpace.s14),
                BaseSwitch(value: false, onChanged: (_) {}),
              ],
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseSwitch), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('switch reports taps', (tester) async {
    var switches = 0;
    bool? toggled;

    await tester.pumpWidget(
      inputHost(
        BaseSwitch(
          value: false,
          onChanged: (value) {
            switches++;
            toggled = value;
          },
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.byType(BaseSwitch));
    await tester.pump();

    expect(switches, 1);
    expect(toggled, isTrue);
  });
}
