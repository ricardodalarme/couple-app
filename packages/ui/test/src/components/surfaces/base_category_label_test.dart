import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

void main() {
  for (final variant in AppThemeVariant.values) {
    testWidgets('every category label renders in ${variant.name}', (tester) async {
      await tester.pumpWidget(
        themedHost(
          SingleChildScrollView(
            child: Wrap(
              spacing: AppSpace.s8,
              runSpacing: AppSpace.s8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (final category in AppCategory.values)
                  BaseCategoryLabel(text: category.name, category: category),
              ],
            ),
          ),
          variant: variant,
        ),
      );

      expect(find.byType(BaseCategoryLabel), findsNWidgets(AppCategory.values.length));
      expect(tester.takeException(), isNull);
    });
  }
}
