import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('surface card renders in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(
          galleryHost(
            const BaseSurfaceCard(
              title: 'Weekend plan',
              supportText: 'Three ideas you saved. None of them is required.',
              privacyNote: 'Only you see this',
              child: Text('Saturday morning, no phones.'),
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseSurfaceCard), findsOneWidget);
        expect(find.text('Weekend plan'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
