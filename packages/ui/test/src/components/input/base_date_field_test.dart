import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BaseDateField(label: 'Date', value: DateTime(2026, 11, 12), onTap: () {}),
      const SizedBox(height: AppSpace.s16),
      BaseDateField(
        label: 'Time',
        value: DateTime(2026, 11, 12, 18),
        mode: BaseDateFieldMode.time,
        helpText: 'Your local time.',
        onTap: () {},
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('date fields render in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(inputHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseDateField), findsNWidgets(2));
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('date field opens the stepper sheet and confirms', (tester) async {
    DateTime? picked;

    await tester.pumpWidget(
      inputHost(
        BaseDateField(
          label: 'Date',
          value: DateTime(2026, 11, 12),
          onChanged: (value) => picked = value,
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.text('2026-11-12'));
    await tester.pumpAndSettle();

    expect(find.text('Confirm'), findsOneWidget);

    await tester.tap(find.byIcon(AppIcons.chevron_up).first);
    await tester.pump();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(picked, DateTime(2026, 11, 13));
    expect(tester.takeException(), isNull);
  });

  testWidgets('date field reports taps', (tester) async {
    var dateTaps = 0;

    await tester.pumpWidget(
      inputHost(
        BaseDateField(label: 'Date', value: DateTime(2026, 11, 12), onTap: () => dateTaps++),
        variant: AppThemeVariant.blue,
      ),
    );

    await tester.tap(find.text('2026-11-12'));
    await tester.pump();

    expect(dateTaps, 1);
    expect(tester.takeException(), isNull);
  });
}
