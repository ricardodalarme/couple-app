import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BaseOptionTile(
        title: 'Every Sunday',
        support: 'The card arrives at 18:00.',
        leading: const AppIcon(icon: AppIcons.calendar),
        isSelected: true,
        onTap: () {},
      ),
      const SizedBox(height: AppSpace.s10),
      BaseOptionTile(
        title: 'Only when I ask',
        support: 'No automatic sending.',
        control: BaseOptionTileControl.checkbox,
        onTap: () {},
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('option tiles render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(inputHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseOptionTile), findsNWidgets(2));
        expect(find.byType(BaseCheckbox), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('option tile reports taps', (tester) async {
    var optionTaps = 0;

    await tester.pumpWidget(
      inputHost(
        BaseOptionTile(
          title: 'Every Sunday',
          support: 'The card arrives at 18:00.',
          onTap: () => optionTaps++,
        ),
        variant: AppThemeVariant.blue,
      ),
    );

    await tester.tap(find.text('Every Sunday'));
    await tester.pump();

    expect(optionTaps, 1);
    expect(tester.takeException(), isNull);
  });
}
