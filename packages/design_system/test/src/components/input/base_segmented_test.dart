import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('segmented controls render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(
          inputHost(
            Column(
              children: [
                BaseSegmented(
                  segments: const ['Week', 'Month'],
                  selectedIndex: 0,
                  onSelectionChanged: (_) {},
                ),
                const SizedBox(height: AppSpace.s16),
                BaseSegmented(
                  segments: const ['Mine', 'Ours', 'Private'],
                  selectedIndex: 1,
                  onSelectionChanged: (_) {},
                ),
              ],
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseSegmented), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('segmented control reports the tapped segment', (tester) async {
    int? selected;

    await tester.pumpWidget(
      inputHost(
        BaseSegmented(
          segments: const ['Week', 'Month'],
          selectedIndex: 0,
          onSelectionChanged: (index) => selected = index,
        ),
        variant: AppThemeVariant.blue,
      ),
    );

    await tester.tap(find.text('Month'));
    await tester.pump();

    expect(selected, 1);
    expect(tester.takeException(), isNull);
  });
}
