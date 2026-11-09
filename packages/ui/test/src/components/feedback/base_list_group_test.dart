import 'package:flutter_test/flutter_test.dart';
import 'package:ui/ui.dart';

import '../../../helpers/widget_host.dart';

Finder _findDividers() => find.byWidgetPredicate(
  (widget) =>
      widget.key is ValueKey<String> &&
      (widget.key! as ValueKey<String>).value.startsWith(baseListGroupDividerKeyPrefix),
);

void main() {
  for (final variant in AppThemeVariant.values) {
    group('${variant.name} theme', () {
      testWidgets('list group draws one inset divider between rows', (tester) async {
        await tester.pumpWidget(
          materialAppFor(
            const BaseListGroup(
              footer: 'Reminders only reach you.',
              children: [Text('One'), Text('Two'), Text('Three')],
            ),
            variant: variant,
          ),
        );

        expect(_findDividers(), findsNWidgets(2));
        expect(find.text('Reminders only reach you.'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    });
  }
}
