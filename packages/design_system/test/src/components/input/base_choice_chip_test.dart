import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('choice chips render in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        inputHost(
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              const BaseChoiceChip(label: 'Said something'),
              BaseChoiceChip(label: 'Did something', isSelected: true, onTap: () {}),
              const BaseChoiceChip(label: 'Noticed me', icon: AppIcons.heart_filled),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump();

      expect(find.byType(BaseChoiceChip), findsNWidgets(3));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('a long label ellipsizes instead of overflowing', (tester) async {
    await tester.pumpWidget(
      inputHost(
        const SizedBox(
          width: 120,
          child: BaseChoiceChip(label: 'A very long choice label that cannot fit'),
        ),
        variant: AppThemeVariant.rose,
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text('A very long choice label that cannot fit'), findsOneWidget);
  });
}
