import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    for (final scale in const [1.0, 2.0]) {
      testWidgets('dividers render in ${variant.name} at ${scale}x text', (tester) async {
        await tester.pumpWidget(
          galleryHost(
            const Column(
              children: [
                BaseDivider(),
                SizedBox(height: AppSpace.s16),
                BaseDivider(isDashed: true),
                SizedBox(height: AppSpace.s16),
                BaseDivider(label: 'or', isInset: true),
              ],
            ),
            variant: variant,
            textScale: scale,
          ),
        );
        await tester.pump();

        expect(find.byType(BaseDivider), findsNWidgets(3));
        expect(tester.takeException(), isNull);

        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
