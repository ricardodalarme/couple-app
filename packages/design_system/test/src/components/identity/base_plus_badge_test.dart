import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('plus badge renders in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(
          galleryHost(
            const BasePlusBadge(text: 'Plus'),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BasePlusBadge), findsOneWidget);
        expect(find.text('Plus'), findsOneWidget);
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
