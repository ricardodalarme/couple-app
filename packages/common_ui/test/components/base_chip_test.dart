import 'package:common_ui/src/components/base_chip.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseChip', () {
    testWidgets('renders the label and forwards taps', (tester) async {
      var taps = 0;

      await tester.pumpApp(BaseChip(label: 'Nearby', selected: false, onTap: () => taps++));
      await tester.tap(find.text('Nearby'));
      await tester.pumpAndSettle();

      expect(taps, 1);
    });

    testWidgets('renders the leading icon when provided', (tester) async {
      await tester.pumpApp(
        BaseChip(label: 'Nearby', selected: true, onTap: () {}, icon: const Icon(IconData(0xe002))),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Icon), findsOneWidget);
    });
  });
}
