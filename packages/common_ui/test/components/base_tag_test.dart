import 'package:common_ui/src/components/base_tag.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helpers/pump_app.dart';

void main() {
  group('BaseTag', () {
    testWidgets('renders the uppercased label', (tester) async {
      await tester.pumpApp(const BaseTag('Draft'));
      await tester.pump();

      expect(find.text('DRAFT'), findsOneWidget);
    });

    testWidgets('renders every variant in both emphases', (tester) async {
      await tester.pumpApp(
        Column(
          children: [
            for (final variant in BaseTagVariant.values) ...[
              BaseTag('soft', variant: variant),
              BaseTag('solid', variant: variant, emphasis: BaseTagEmphasis.solid),
            ],
          ],
        ),
      );
      await tester.pump();

      expect(find.byType(BaseTag), findsNWidgets(BaseTagVariant.values.length * 2));
    });
  });
}
