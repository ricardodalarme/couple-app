import 'package:common_ui/common_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group(BaseDivider, () {
    group('.text', () {
      testWidgets('renders widget', (tester) async {
        await tester.pumpApp(const BaseDivider.text(text: 'Divider'));
        await tester.pump();

        expect(find.byType(BaseDivider), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(const BaseDivider.text(text: 'Divider'));
        await tester.pump();

        expect(find.text('Divider'), findsOneWidget);
      });

      testWidgets('renders dividers', (tester) async {
        await tester.pumpApp(const BaseDivider.text(text: 'Divider'));
        await tester.pump();

        expect(find.byType(BaseDividerLine), findsNWidgets(2));
      });
    });
  });
}
