import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('note renders at 200% text for ${variant.name}', (tester) async {
      await tester.pumpWidget(
        scaffoldHost(const BaseNote(text: 'Stays private until Sunday.'), variant: variant),
      );
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('Stays private until Sunday.'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.pumpWidget(const SizedBox());
    });
  }
}
