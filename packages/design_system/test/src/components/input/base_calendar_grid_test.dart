import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('calendar grid renders in ${variant.name} at ${scale}x', (tester) async {
        await tester.pumpWidget(
          inputHost(
            BaseCalendarGrid(month: DateTime(2026, 11), today: DateTime(2026, 11, 9)),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseCalendarGrid), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }

  testWidgets('calendar selects a day and changes month', (tester) async {
    DateTime? selected;
    DateTime? monthChanged;

    await tester.pumpWidget(
      inputHost(
        BaseCalendarGrid(
          month: DateTime(2026, 11),
          today: DateTime(2026, 11, 9),
          milestones: {DateTime(2026, 11, 14)},
          blockedDays: {DateTime(2026, 11, 20)},
          onDaySelected: (date) => selected = date,
          onMonthChanged: (month) => monthChanged = month,
        ),
        variant: AppThemeVariant.neutral,
      ),
    );

    await tester.tap(find.text('12'));
    await tester.pump();

    expect(selected, DateTime(2026, 11, 12));

    await tester.tap(find.byIcon(AppIcons.chevron_right));
    await tester.pump();

    expect(monthChanged, DateTime(2026, 12));
    expect(find.text('December 2026'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('calendar range mode closes the range', (tester) async {
    DateTime? start;
    DateTime? end;

    await tester.pumpWidget(
      inputHost(
        StatefulBuilder(
          builder: (context, setState) {
            return BaseCalendarGrid(
              month: DateTime(2026, 11),
              rangeStart: start,
              rangeEnd: end,
              selectionMode: BaseCalendarSelectionMode.range,
              onRangeChanged: (rangeStart, rangeEnd) {
                setState(() {
                  start = rangeStart;
                  end = rangeEnd;
                });
              },
            );
          },
        ),
        variant: AppThemeVariant.rose,
      ),
    );

    await tester.tap(find.text('10'));
    await tester.pump();
    expect(start, DateTime(2026, 11, 10));
    expect(end, isNull);

    await tester.tap(find.text('14'));
    await tester.pump();
    expect(start, DateTime(2026, 11, 10));
    expect(end, DateTime(2026, 11, 14));
    expect(tester.takeException(), isNull);
  });
}
