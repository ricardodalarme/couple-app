import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/week_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

const _labels = ['seg', 'ter', 'qua', 'qui', 'sex', 'sáb', 'dom'];

void main() {
  testWidgets('draws one slip per day with a count and marks today', (tester) async {
    await tester.pumpApp(
      const WeekCard(
        title: '3 slips',
        supportText: 'cartão no domingo',
        dayLabels: _labels,
        dayCounts: [1, 0, 2, 0, 1, 0, 0],
        todayIndex: 6,
      ),
    );

    expect(find.byType(AppPaperSlip), findsNWidgets(3));
    expect(find.text('seg'), findsOneWidget);
    expect(find.text('dom'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.byIcon(AppIcons.mail_filled), findsOneWidget);
  });

  testWidgets('a slip on today keeps its paper slip and today marker', (tester) async {
    await tester.pumpApp(
      const WeekCard(
        title: '1 slip',
        supportText: 'cartão no domingo',
        dayLabels: _labels,
        dayCounts: [0, 0, 1, 0, 0, 0, 0],
        todayIndex: 2,
      ),
    );

    expect(find.byType(AppPaperSlip), findsOneWidget);
    expect(find.byIcon(AppIcons.mail_filled), findsNothing);
    expect(find.text('qua'), findsOneWidget);
  });

  testWidgets('an empty week still shows all seven days', (tester) async {
    await tester.pumpApp(
      const WeekCard(
        title: 'Nenhum slip',
        supportText: 'sem pressa',
        dayLabels: _labels,
        dayCounts: [0, 0, 0, 0, 0, 0, 0],
        todayIndex: 2,
      ),
    );

    expect(find.byType(AppPaperSlip), findsNothing);
    expect(find.text('Nenhum slip'), findsOneWidget);
    expect(find.text('sem pressa'), findsOneWidget);
    for (final label in _labels) {
      expect(find.text(label), findsOneWidget);
    }
    expect(find.byIcon(AppIcons.mail_filled), findsOneWidget);
  });
}
