import 'package:clock/clock.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

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

  testWidgets('an empty date field opens the stepper at today, not the minimum', (tester) async {
    await withClock(Clock.fixed(DateTime(2026, 11, 13, 10)), () async {
      await tester.pumpWidget(
        inputHost(
          BaseDateField(
            label: 'Date',
            hint: 'Pick a date',
            minimum: DateTime(1950),
            maximum: DateTime(2027, 12, 31),
            onChanged: (_) {},
          ),
          variant: AppThemeVariant.rose,
        ),
      );

      await tester.tap(find.text('Pick a date'));
      await tester.pumpAndSettle();

      expect(find.text('2026'), findsOneWidget);
      expect(find.text('11'), findsOneWidget);
      expect(find.text('13'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  testWidgets('holding a stepper arrow repeats instead of stepping once', (tester) async {
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

    final yearUp = find.ancestor(
      of: find.byIcon(AppIcons.chevron_up),
      matching: find.byType(AppPressable),
    );
    final gesture = await tester.startGesture(tester.getCenter(yearUp.last));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.pump(const Duration(seconds: 1));
    await gesture.up();
    await tester.pump();

    expect(find.text('2026'), findsNothing);

    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(picked!.year, greaterThan(2027));
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
