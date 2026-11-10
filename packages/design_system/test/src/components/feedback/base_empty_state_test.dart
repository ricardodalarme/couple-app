import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('empty state renders both actions at 200% text for ${variant.name}', (
      tester,
    ) async {
      await tester.pumpWidget(
        scaffoldHost(
          const SingleChildScrollView(
            padding: EdgeInsets.all(AppSpace.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BaseEmptyState(
                  title: 'No slips yet',
                  text: 'A slip is one good thing, in one line.',
                  actionText: 'Write a slip',
                  faceLabel: 'A smiling face',
                ),
                BaseEmptyState(
                  title: 'Nothing here',
                  text: 'When it happens it will show up here.',
                  actionText: 'Go back',
                  isSecondaryAction: true,
                ),
              ],
            ),
          ),
          variant: variant,
        ),
      );
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('No slips yet'), findsOneWidget);
      expect(find.text('Nothing here'), findsOneWidget);
      expect(find.text('Write a slip'), findsOneWidget);
      expect(find.text('Go back'), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.pumpWidget(const SizedBox());
    });
  }
}
