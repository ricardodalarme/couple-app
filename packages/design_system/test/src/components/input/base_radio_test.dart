import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('radios render in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        inputHost(
          Row(
            children: [
              BaseRadio(isSelected: true, onTap: () {}),
              const SizedBox(width: AppSpace.s14),
              const BaseRadio(isSelected: false),
            ],
          ),
          variant: variant,
        ),
      );
      await tester.pump();

      expect(find.byType(BaseRadio), findsNWidgets(2));
      expect(tester.takeException(), isNull);
    });
  }
}
