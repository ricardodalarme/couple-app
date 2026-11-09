import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Widget _gallery() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BaseBubble(variant: BaseBubbleVariant.own, text: 'Dinner out tonight?', time: '18:42'),
      SizedBox(height: AppSpace.s8),
      BaseBubble(text: 'Yes, the usual place.', time: '18:44'),
      SizedBox(height: AppSpace.s8),
      BaseBubble(variant: BaseBubbleVariant.typing, semanticLabel: 'Typing'),
      SizedBox(height: AppSpace.s8),
      BaseBubble(
        variant: BaseBubbleVariant.failure,
        text: 'See you at eight.',
        time: '18:45',
        action: Text('Try again'),
      ),
    ],
  );
}

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('bubbles render in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(galleryHost(_gallery(), variant: variant, textScale: scale));
        await tester.pump();

        expect(find.byType(BaseBubble), findsNWidgets(4));
        expect(find.text('Dinner out tonight?'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
