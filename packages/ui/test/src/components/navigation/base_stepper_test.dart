import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('stepper announces the current step for ${variant.name}', (tester) async {
      setSurface(tester);
      final semantics = tester.ensureSemantics();

      await tester.pumpWidget(
        appFor(
          variant: variant,
          home: const Scaffold(body: Center(child: BaseStepper(count: 5, currentIndex: 2))),
        ),
      );

      expect(find.bySemanticsLabel('Step 3 of 5'), findsOneWidget);
      semantics.dispose();
    });
  }
}
