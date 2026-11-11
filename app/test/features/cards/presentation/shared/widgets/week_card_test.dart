import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/cards/presentation/shared/widgets/week_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  testWidgets('draws one slip per filled count and caps at seven', (tester) async {
    await tester.pumpApp(
      const WeekCard(title: '3 slips', supportText: 'Esta semana', filledCount: 3),
    );
    expect(find.byType(AppPaperSlip), findsNWidgets(3));

    await tester.pumpApp(const WeekCard(title: 'Muitos', filledCount: 12));
    expect(find.byType(AppPaperSlip), findsNWidgets(7));
  });

  testWidgets('shows only empty slots for an empty week', (tester) async {
    await tester.pumpApp(const WeekCard(title: 'Nenhum slip', filledCount: 0));

    expect(find.byType(AppPaperSlip), findsNothing);
    expect(find.text('Nenhum slip'), findsOneWidget);
  });
}
