import 'package:design_system/design_system.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/widget_host.dart';

void main() {
  testWidgets('renders a pressable child', (tester) async {
    await tester.pumpWidget(themedHost(const AppPressable(child: Text('Tap me'))));

    expect(find.text('Tap me'), findsOneWidget);
    expect(find.byType(AppPressable), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
