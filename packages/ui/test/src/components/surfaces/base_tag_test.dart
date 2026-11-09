import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('tag renders in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        themedHost(
          const Center(child: BaseTag(text: 'Manias')),
          variant: variant,
        ),
      );

      expect(find.byType(BaseTag), findsOneWidget);
      expect(find.text('MANIAS'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
