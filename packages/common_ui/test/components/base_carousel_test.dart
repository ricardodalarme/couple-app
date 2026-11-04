import 'package:common_ui/src/components/base_carousel.dart';
import 'package:common_ui/src/components/base_page_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseCarousel', () {
    testWidgets('renders nothing without items', (tester) async {
      await tester.pumpApp(const BaseCarousel(itemCount: 0, height: 200, itemBuilder: _item));
      await tester.pump();

      expect(find.byType(PageView), findsNothing);
    });

    testWidgets('renders a single item without an indicator', (tester) async {
      await tester.pumpApp(const BaseCarousel(itemCount: 1, height: 200, itemBuilder: _item));
      await tester.pump();

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.byType(BasePageIndicator), findsNothing);
    });

    testWidgets('renders the first page and its indicator', (tester) async {
      await tester.pumpApp(const BaseCarousel(itemCount: 3, height: 200, itemBuilder: _item));
      await tester.pump();

      expect(find.text('Item 0'), findsOneWidget);
      expect(find.byType(BasePageIndicator), findsOneWidget);
    });

    testWidgets('swipes to the next page', (tester) async {
      await tester.pumpApp(const BaseCarousel(itemCount: 3, height: 200, itemBuilder: _item));
      await tester.pump();
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(find.text('Item 1'), findsOneWidget);
    });
  });
}

Widget _item(BuildContext context, int index) => Center(child: Text('Item $index'));
