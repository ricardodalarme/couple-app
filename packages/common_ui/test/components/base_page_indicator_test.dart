import 'package:common_ui/src/components/base_page_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BasePageIndicator', () {
    testWidgets('renders one dot per page', (tester) async {
      await tester.pumpApp(const BasePageIndicator(count: 4, current: 1));
      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(4));
    });

    testWidgets('notifies the selected page', (tester) async {
      int? selected;

      await tester.pumpApp(
        BasePageIndicator(count: 3, current: 0, onSelected: (index) => selected = index),
      );
      await tester.tap(find.byType(AnimatedContainer).at(2));
      await tester.pumpAndSettle();

      expect(selected, 2);
    });

    testWidgets('labels the dots through the builder', (tester) async {
      final semantics = tester.ensureSemantics();

      await tester.pumpApp(
        BasePageIndicator(count: 2, current: 0, dotLabelBuilder: (index) => 'Page ${index + 1}'),
      );
      await tester.pump();

      expect(find.bySemanticsLabel('Page 1'), findsOneWidget);
      expect(find.bySemanticsLabel('Page 2'), findsOneWidget);

      semantics.dispose();
    });
  });
}
